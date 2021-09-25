import pytest
from fastapi.testclient import TestClient

from app_python.config import config
from app_python.main import app


@pytest.fixture()
def client():
    client = TestClient(app)
    return client


@pytest.fixture(autouse=True)
def populate_visits(tmp_path):
    visits = tmp_path / "visits.txt"
    config.visits_file = visits
