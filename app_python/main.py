from typing import Awaitable, Callable

from fastapi import FastAPI, Request, Response
from prometheus_fastapi_instrumentator import Instrumentator

from app_python.config import config
from app_python.routers import time_router, visits_router
from app_python.routers.time import get_current_time_str

app = FastAPI(
    title="Moscow time",
    description="Shows current Moscow time (GMT +3)",
)

app.include_router(time_router, prefix="")
app.include_router(visits_router, prefix="/visits")

Instrumentator().instrument(app).expose(
    app,
    endpoint="/metrics",
    include_in_schema=True,
    should_gzip=False,
)


@app.middleware("http")
async def add_process_time_header(
    request: Request,
    call_next: Callable[[Request], Awaitable[Response]],
) -> Response:
    config.visits_file.parent.mkdir(parents=True, exist_ok=True)
    response = await call_next(request)
    if request.url.path == "/":
        access_time_str = get_current_time_str()
        with config.visits_file.open("a") as f:
            f.write(access_time_str + "\n")
    return response
