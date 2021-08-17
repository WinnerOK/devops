from datetime import datetime

from fastapi import APIRouter
from fastapi.responses import PlainTextResponse
from pytz import timezone

MOSCOW_TZ = timezone("Europe/Moscow")
time_router = APIRouter(
    tags=["time"],
)


@time_router.get("/", response_class=PlainTextResponse)
def get_time() -> str:
    """
    Show current datetime in Moscow
    """
    current_time = datetime.now(tz=MOSCOW_TZ).isoformat()
    return current_time
