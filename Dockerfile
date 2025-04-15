FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=app
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["flask", "run"]

# Optional: HEALTHCHECK (for container itself)
HEALTHCHECK CMD curl --fail http://localhost:5000 || exit 1
