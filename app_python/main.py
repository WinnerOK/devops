from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

from app_python.routers import time_router

app = FastAPI(
    title="Moscow time",
    description="Shows current Moscow time (GMT +3)",
)

app.include_router(time_router, prefix="")

Instrumentator().instrument(app).expose(
    app,
    endpoint="/metrics",
    include_in_schema=True,
    should_gzip=False,
)
