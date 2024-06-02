@python

## Alembic

Create a new alembic (empty) template version:

    PYTHONPATH=. alembic revision -m  "vXXX"

Autogenerate a new alembic upgrade version script:

    PYTHONPATH=. alembic revision --autogenerate -m "vXXX"

Upgrade a database according to alemic revision:

    PYTHONPATH=. alembic upgrade head
