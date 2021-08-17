import pytest
from fastapi.testclient import TestClient

from app_python.main import app


@pytest.fixture()
def client():
    client = TestClient(app)
    return client
