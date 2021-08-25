# Python practices

**__Note:__** mainly this part comes from [TezRomacH/python-package-template](https://github.com/TezRomacH/python-package-template)
since it combines good tools I used to know, and some new analysis instruments.

## Used libraries

### Frameworks

- [FastAPI](https://fastapi.tiangolo.com/)  is good web-framework
  due to explicit typing requirements, automated documentation,
  fast backend.

- [Pytest](https://docs.pytest.org/en/) - flexible test framework

### Static analysis

- [Mypy](http://mypy-lang.org/) - static type checker for python
- [Safety](https://pyup.io/safety/) - validates requirements for known security vulnerabilities
- [Bandit](https://github.com/PyCQA/bandit) - python-code analyzer for common vulnerable code patterns
- [darglint](https://github.com/terrencepreilly/darglint) - documentation checker.
  Validates that documentation corresponds to function implementation by signature

### Formatters

- [editorconfig](https://editorconfig.org/) - a tool that allows to describe style rules understandable by many IDEs out-of-box
- [isort](https://github.com/PyCQA/isort) - import sorter for reading ease
- [black](https://github.com/psf/black) - good code formatter
- [pyupgrade](https://github.com/asottile/pyupgrade) - tool that replaces deprecated syntax to updated alternatives

### VCS integration

- [pre-commit](https://pre-commit.com/) - a tool to simplify management of pre-commit github hooks.
  Used hooks:
  - common hooks from [pre-commit official repo](https://github.com/pre-commit/pre-commit-hooks)
    for yaml-validation and newline fixer
  - hooks for formatters
  - hook for bandit
- [gitignore.io](https://gitignore.io) - a website that generates gitignore files for popular tools

### Build automation

- [Make](<https://en.wikipedia.org/wiki/Make_(software)>) - handy tool to describe commonly used commands in the project.
  For example: build, lint, cache-clear

## Testing

### Unit testing

As mentioned before, the testing is done using `pytest` framework, since it:

- provides easy interface for testing
- has fixture mechanism for state preparation (and dependency resolution between fixtures)
- is a flexible framework allowing test parametrization and custom plugins

Unit testing practices:

- Refactor code, so we can test one piece of functionality at a time

- Tests must be fully independent. In particular:

  - pass regardless the order of execution
  - run on fresh dataset every time

- Have small readable tests. Usually we can separate 3 parts of a test:

  1. setup: preparation of data.
     Often common for several tests so can be factored out into fixtures
  1. test: asserting a state
  1. possibly, teardown: if needed -- destruction of data

- If there are not a lot of tests, we can add running test into pre-commit hooks
  so that developers do not push a broken code

- Unit tests should be fast in order not to slow down development.
  If there are slow test, they should be filtered out and run periodically in a CI job.

- Keep track of test coverage to verify that new code is at least covered by tests
