# CI practices

## Github actions

- Utilize cache in order not to re-build unchanged dependencies or indices.

  - For general usage one can use caching action [actions/cache](https://github.com/actions/cache)
  - During docker-build use `--cache-from` parameter.

- Limit access of used `GITHUB_TOKEN` via [permissions](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#permissions).
  You can also limit default permissions at settings:
  ![Workflow permissions setting](https://i.imgur.com/s1h42qp.png)

- If a workflow runs on `pull_request`, make sure to disable automatic run from 3rd party forks.
  Go to the `Settings -> Actions`: ![Fork pull request workflows from outside collaborators setting](https://i.imgur.com/MvG1Oje.png)

- Make sure that used github actions are secure. Limit allowed actions to only trusted ones via
  Actions settings: ![Actions permissions setting](https://i.imgur.com/DBMRDy7.png)

- Pass user input to scripts only via "proxy-variables" or use as input to actions
  in order to prevent code injection.

- Utilize Github Secrets for sensitive data such as credentials.
