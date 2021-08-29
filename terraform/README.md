# Infrastructure as code

I was not able to run terraform under
the only currently available virtualbox provider [terra-farm/virtualbox](https://registry.terraform.io/providers/terra-farm/virtualbox/latest)
since the example provided at official documentation fails with not really descriptive error after some time:

```
virtualbox_vm.node[0]: Creating...
virtualbox_vm.node[1]: Creating...
virtualbox_vm.node[0]: Still creating... [10s elapsed]
virtualbox_vm.node[1]: Still creating... [10s elapsed]
...
virtualbox_vm.node[1]: Still creating... [1m30s elapsed]
virtualbox_vm.node[0]: Still creating... [1m30s elapsed]
╷
│ Error: [ERROR] Setup VM properties: exit status 1
│ 
│   with virtualbox_vm.node[0],
│   on vbox.tf line 1, in resource "virtualbox_vm" "node":
│    1: resource "virtualbox_vm" "node" {
│ 
╵
╷
│ Error: [ERROR] Setup VM properties: exit status 1
│ 
│   with virtualbox_vm.node[1],
│   on vbox.tf line 1, in resource "virtualbox_vm" "node":
│    1: resource "virtualbox_vm" "node" {
│ 
╵
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
