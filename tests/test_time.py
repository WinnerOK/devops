from datetime import datetime

import pytest
from fastapi import status
from pytz import timezone

MOSCOW_TZ = timezone("Europe/Moscow")


@pytest.mark.parametrize(
    ("set_dt",),
    [
        ("2021-08-16 13:14+03:00",),
        ("2021-08-16 23:59+03:00",),
        ("2021-08-16 00:00+03:00",),
    ],
)
def test_get_time(client, freezer, set_dt):
    freezer.move_to(set_dt)
    rv = client.get("/")
    assert rv.status_code == status.HTTP_200_OK

    parsed_time = datetime.fromisoformat(rv.text)
    assert parsed_time == datetime.now(tz=MOSCOW_TZ)
