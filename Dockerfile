FROM python:3.12-slim

WORKDIR /app

COPY main.py .
COPY pyproject.toml .
COPY .python-version .
COPY uv.lock .

RUN pip install --no-cache-dir uv
RUN uv sync --no-cache

EXPOSE 8000

CMD [".venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


