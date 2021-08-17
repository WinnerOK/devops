FROM python:3.9-slim-buster

# Disable package cache.
ENV PIP_NO_CACHE_DIR=off
# Python won’t try to write .pyc files on the import of source modules.
ENV PYTHONDONTWRITEBYTECODE=on
# install a handler for SIGSEGV, SIGFPE, SIGABRT, SIGBUS and SIGILL signals to dump the Python traceback
ENV PYTHONFAULTHANDLER=on
# Force the stdout and stderr streams to be unbuffered.
ENV PYTHONUNBUFFERED=on
# set workdir as PYTHONPATH
ENV PYTHONPATH=/workspace

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  PATH="${PATH}:/root/.poetry/bin"

# Install curl to download poetry in future and remove all cache
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  \
  && apt-get autoclean && apt-get autoremove

# Heathcheck is required to return 0 or 1
HEALTHCHECK CMD curl -f http://localhost:8000/ || exit 1

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY pyproject.toml ./

# Allow installing dev dependencies to run tests
ARG INSTALL_DEV=false
RUN bash -c "if [ $INSTALL_DEV == 'true' ] ; then poetry install --no-root ; else poetry install --no-root --no-dev ; fi"

CMD mkdir -p /workspace
WORKDIR /workspace

COPY ./Makefile ./
COPY ./app_python ./app_python
COPY ./tests ./tests

CMD poetry run uvicorn app_python.main:app --host 0.0.0.0
