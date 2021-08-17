from fastapi import FastAPI

from app_python.routers import time_router

app = FastAPI(
    title="Moscow time",
    description="Shows current Moscow time (GMT +3)",
)

app.include_router(time_router, prefix="")
