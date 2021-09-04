# Introduction

The app environment is built
referencing [TezRomacH/python-package-template](https://github.com/TezRomacH/python-package-template)
with some modifications

## App description

The app shows datetime in Moscow timezone (GMT+3)

- App runs on port `8000`
- Swagger is available at `/docs`
- Application metrics are available at `/metrics`

## Deployment

1. Fill `~/.aws/credentials` in the following format (in order for dynamic inventory to work properly):
   ```
   [default]
   aws_access_key_id=<your aws key id>
   aws_secret_access_key=<your aws access key>
   ```
1. Fill in `IaC/terraform/variables.tfvars`
   as `IaC/terraform/example.tfvars`
1. Go to [IaC/terraform](./IaC/terraform) folder
1. Run terraform:
   ```
   terraform plan
   ```
   If everything goes as expected, run
   ```
   terraform apply
   ```
1. Go to [ansible](./ansible) folder:
1. Install ansible dependencies
   ```
   pip3 install -r requirements.txt
   ansible-galaxy install -r requirements.yml
   ```
1. Verify the dynamic inventory
   ```
   ansible-inventory -i ./inventory --graph
   ```
1. Run ansible:
   ```
   ansible-playbook -i ./inventory --private-key <path to your private key> provision_app.yml
   ```
   In case needed, you can overwrite ansible varibles from command line

## Testing

The code is tested using `pytest` framework.
Tests are located at `/tests` folder

Run tests executing either:

```bash
poetry run pytest
```

or

```bash
make test
```

## Start coding

### Initialize your code

0. Clone repo
1. If you don't have `Poetry` installed run:

```bash
make poetry-download
```

0. Initialize poetry and install `pre-commit` hooks:

```bash
make install
make pre-commit-install
```

### Makefile usage

[`Makefile`](https://github.com/WinnerOK/app_python/blob/master/Makefile) contains often used commands

<details>
<summary>1. Download and remove Poetry</summary>
<p>   

Download and install Poetry:

```bash
make poetry-download
```

Uninstall Poetry

```bash
make poetry-remove
```

</p>
</details>

<details>
<summary>2. Install all dependencies and pre-commit hooks</summary>
<p>

Install requirements:

```bash
make install
```

Install pre-commit hooks:

```bash
make pre-commit-install
```

</p>
</details>

<details>
<summary>3. Codestyle</summary>
<p>

Automatic formatting uses `pyupgrade`, `isort` and `black`.

```bash
make format
```

Codestyle checks only, without rewriting files (uses `isort`, `black` and `darglint`):

```bash
make check-codestyle
```

</details>
<details>
<summary>4. Code security</summary>
<p>
Launch `Poetry` integrity checks, dependency vulnerability checks via `Safety`
and code analysis using `Bandit`.

```bash
make check-safety
```

</p>
</details>

<details>
<summary>5. Type checks</summary>
<p>

Run `mypy` type checker

```bash
make mypy
```

</p>
</details>

<details>
<summary>6. Tests</summary>
<p>

Run `pytest`

```bash
make test
```

</p>
</details>

<details>
<summary>7. All linters</summary>
<p>
test, codestyle checks, mypy checks and safety checks:
```bash
make lint
```
</p>
</details>

<details>
<summary>8. Docker</summary>
<p>

```bash
make docker-build
```

which is equivalent to:

```bash
make docker-build VERSION=latest
```

Remove docker image with

```bash
make docker-remove
```

Docker [readme](https://github.com/WinnerOK/app_python/tree/master/docker).

</p>
</details>

<details>
<summary>9. Cleanup</summary>
<p>
Delete pycache files

```bash
make pycache-remove
```

Or to remove pycache, build and docker image run:

```bash
make clean-all
```

</p>

</details>
