# Docker for app_python

## Installation

Run docker

```bash
make docker-build
```

Build a version with specific tag or version

```bash
make docker-build IMAGE=some_name VERSION=0.1.0
```

## Run app

The app will be running at `http://localhost:8000`

```bash
docker run -it -p 8000:8000 -d winnerokay/app_python
```
