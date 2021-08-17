# Docker practices

- Make light images:

  - Use light base with as little useless tools as possible.
    [Here](https://medium.com/swlh/alpine-slim-stretch-buster-jessie-bullseye-bookworm-what-are-the-differences-in-docker-62171ed4531d) is a version comparison for python images.
  - Cleanup temporary directories and unused builds

- Since docker operates with layers, move rarely changed layers to top
  in order to improve caching for builds.

- Take advantage over healthchecks for an application to see current status
