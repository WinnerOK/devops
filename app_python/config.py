from pathlib import Path

from pydantic import BaseSettings


class Config(BaseSettings):
    visits_file: Path = Path("media/visits.txt")


config = Config()
