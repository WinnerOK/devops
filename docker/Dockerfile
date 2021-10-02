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
# Use update because by default apt does not see curl
RUN apt-get update && apt-get install -y --no-install-recommends \
  curl=7.64.0-4+deb10u2 \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  \
  && apt-get autoclean && apt-get autoremove && \
  adduser --disabled-password --shell /bin/sh --home /home/moscow_clock moscow_clock

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

COPY pyproject.toml ./

ARG INSTALL_DEV='false'
RUN bash -c "if [ $INSTALL_DEV == 'true' ] ; then poetry install --no-root ; else poetry install --no-root --no-dev ; fi"

USER moscow_clock
WORKDIR /home/moscow_clock

COPY --chown=moscow_clock:moscow_clock ./app_python ./app_python

CMD poetry run uvicorn app_python.main:app --host 0.0.0.0
