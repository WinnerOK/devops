pipeline {
    agent { docker { image 'python:3.9-slim-buster' } }
    stages {
        stage('deps') {
            steps {
                sh '''
                    apt-get update && apt-get install -y --no-install-recommends curl=7.64.0-4+deb10u2
                    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_HOME=/opt/poetry python && \
                      cd /usr/local/bin && \
                      ln -s /opt/poetry/bin/poetry && \
                      poetry config virtualenvs.create false && \
                      cd -
                    poetry install --no-root
                '''
            }
        }
        stage('main') {
            steps {
                parallel (
                    'testing': {
                        sh 'poetry run pytest'
                    },
                    'linting': {
                        sh '''
                        poetry run isort --diff --check-only --settings-path pyproject.toml ./
                        poetry run black --diff --check --config pyproject.toml ./
                        poetry run darglint --verbosity 2 app_python tests
                        poetry run mypy --config-file pyproject.toml ./
                        '''
                    }
                )
            }
        }
    }
}
