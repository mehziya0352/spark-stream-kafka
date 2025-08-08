#!/bin/bash

ENV_FILE=".env_${USER}"

# Assign random available ports if .env file doesn't exist
if [ ! -f "$ENV_FILE" ]; then
    echo "Creating new env file for user: $USER"

    echo "ZOOKEEPER_PORT=$(shuf -i 20000-30000 -n 1)" > "$ENV_FILE"
    echo "KAFKA_PORT=$(shuf -i 30001-40000 -n 1)" >> "$ENV_FILE"
    echo "SPARK_UI_PORT=$(shuf -i 40001-50000 -n 1)" >> "$ENV_FILE"
    echo "SPARK_MASTER_PORT=$(shuf -i 50001-60000 -n 1)" >> "$ENV_FILE"
    echo "FLINK_UI_PORT=$(shuf -i 60001-61000 -n 1)" >> "$ENV_FILE"
    echo "KAFKA_UI_PORT=$(shuf -i 61001-62000 -n 1)" >> "$ENV_FILE"
else
    echo "Using existing env file for user: $USER"
fi

export $(cat "$ENV_FILE" | xargs)

# Start docker compose
docker-compose --env-file "$ENV_FILE" up -d

echo ""
echo "===== Ports for $USER ====="
cat "$ENV_FILE"
echo "==========================="
