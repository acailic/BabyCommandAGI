FROM python:3.11-slim

ENV PIP_NO_CACHE_DIR=true
WORKDIR /tmp
# Install build tools with the default toolchain available in the base image
RUN apt-get update \
    && apt-get install -y build-essential gcc g++ \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r requirements.txt

WORKDIR /workspace
WORKDIR /app
COPY . /app
ENTRYPOINT ["./babyagi.py"]
EXPOSE 8080
