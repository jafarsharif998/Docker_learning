FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir flask mysqlclient

# Expose Flask port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]


# stage 1: Build stage

FROM python:3.11-slim AS build

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    default-libmysqlclient-dev \
    pkg-config

# Copy application code
COPY . .

RUN pip install flask mysqlclient


# stage 2: production stage
FROM python:3.11-slim
WORKDIR /app
COPY --from=Build /app /app

EXPOSE 5000
CMD ["python", "app.py"]

