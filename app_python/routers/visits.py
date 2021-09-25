from fastapi import APIRouter
from fastapi.responses import PlainTextResponse

from app_python.config import config

visits_router = APIRouter(
    tags=["visits"],
)


@visits_router.get("/", response_class=PlainTextResponse)
def get_visits() -> str:
    # existence guaranteed by middleware
    return config.visits_file.read_text()
