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

## Jenkins

Since we do run Jenkins inside docker and run agent as docker,
we need docker-in-docker (dind) installation. One idea is to just mount a docker socket.
Another approach is to run dind in a separate container as described in the following [docker-compose file](https://gist.github.com/adelmofilho/5a30a87eaf1cd4a03052f37b516d6714)

- Some tasks in jenkins can be executed in parallel, take advantage of it you have independent steps
  Yet be very careful in order not to create race conditions or not to make uncotrolled requests to resources with exclusive access.
  [Throttle concurrent build](https://wiki.jenkins.io/display/JENKINS/Throttle+Concurrent+Builds+Plugin) plugin may help to control concurrent builds.
