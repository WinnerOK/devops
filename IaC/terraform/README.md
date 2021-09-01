# Infrastructure as code

I was not able to run terraform under
the only currently available virtualbox provider [terra-farm/virtualbox](https://registry.terraform.io/providers/terra-farm/virtualbox/latest)
since the example provided at official documentation fails with not really descriptive error.

```
virtualbox_vm.node[0]: Creating...
virtualbox_vm.node[0]: Still creating... [10s elapsed]
...
virtualbox_vm.node[0]: Still creating... [1m30s elapsed]
╷
│ Error: [ERROR] Setup VM properties: exit status 1
│ 
│   with virtualbox_vm.node[0],
│   on vbox.tf line 1, in resource "virtualbox_vm" "node":
│    1: resource "virtualbox_vm" "node" {
│ 
╵
```

Running `terraform apply` with logging enabled does not reveal a particular problem:
As a replacement I provided simple Vagrantfile to run a VBox VM.

```
2021-08-30T13:22:52.924+0300 [WARN]  Provider "registry.terraform.io/terra-farm/virtualbox" produced an invalid plan for virtualbox_vm.node[0], but we are tolerating it because it is using the legacy plugin SDK.
    The following problems may be the cause of any confusing errors from downstream operations:
      - .status: planned value cty.StringVal("running") for a non-computed attribute
...
2021-08-30T13:23:43.893+0300 [DEBUG] provider.terraform-provider-virtualbox_v0.2.1-alpha.1: pid-8444-utils.go:12: [ERROR] Setup VM properties: exit status 1
2021-08-30T13:23:43.893+0300 [TRACE] maybeTainted: virtualbox_vm.node[0] encountered an error during creation, so it is now marked as tainted
...
2021-08-30T13:23:43.929+0300 [TRACE] vertex "virtualbox_vm.node[0]": visit complete
2021-08-30T13:23:43.930+0300 [TRACE] dag/walk: upstream of "provider[\"registry.terraform.io/terra-farm/virtualbox\"] (close)" errored, so skipping
2021-08-30T13:23:43.930+0300 [TRACE] dag/walk: upstream of "meta.count-boundary (EachMode fixup)" errored, so skipping
2021-08-30T13:23:43.934+0300 [TRACE] dag/walk: upstream of "root" errored, so skipping
...
╷
│ Error: [ERROR] Setup VM properties: exit status 1
│ 
│   with virtualbox_vm.node[0],
│   on main.tf line 10, in resource "virtualbox_vm" "node":
│   10: resource "virtualbox_vm" "node" {
│ 
╵
2021-08-30T13:23:43.959+0300 [TRACE] statemgr.Filesystem: removing lock metadata file .terraform.tfstate.lock.info
2021-08-30T13:23:43.960+0300 [TRACE] statemgr.Filesystem: unlocking terraform.tfstate using fcntl flock
2021-08-30T13:23:43.961+0300 [DEBUG] provider.stdio: received EOF, stopping recv loop: err="rpc error: code = Unavailable desc = transport is closing"
```

## Terraform practices

- Utilize built-in formatter (`terraform fmt`) and linter (`terraform validate`)

- Hide sensitive/private data inside variables so that people with proper permissions are able to put required values
  into `*.tfvars` file. Therefore, always run terraform commands specifying `-var-file`

- While working in team, prefer remotely managed state. Easiest in my opinion is [GitLab storage](https://docs.gitlab.com/ee/user/infrastructure/terraform_state.html).
  It also enables transparent access to the state from inside CI process.

- Separate state description over multiple files by semantics, thus it is easy to navigate and make changes in the project.
  Next stage of separation and abstraction is using [terraform modules](https://www.terraform.io/docs/language/modules/syntax.html)

- Once IaC management infrastructure grows, enforce team permissions to only their project.
  Then disable ability to make changes outside IaC (via UI or API)
