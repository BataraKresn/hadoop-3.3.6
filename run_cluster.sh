#!/bin/bash

# Function to check if a Docker network exists
network_exists() {
  docker network inspect "$1" >/dev/null 2>&1
}

# Create new network if it doesn't exist
NETWORK_NAME="hadoop-network"
if network_exists "$NETWORK_NAME"; then
  echo "Network $NETWORK_NAME already exists."
else
  echo "Creating network $NETWORK_NAME..."
  docker network create "$NETWORK_NAME"
fi

# # # build docker image with image name hadoop-base:3.3.6
# docker build -t hadoop-base:3.3.6 -f Dockerfile-hadoop .
# docker build -t hadoop-spark-java-python:3.3.6 -f Dockerfile-hadoop .

# # # running image to container, -d to run it in daemon mode
# docker compose -f docker-compose-hadoop.yml up -d

# # # Run Airflow Cluster
# if [[ "$PWD" != "airflow" ]]; then
#   cd airflow && ./run_airflow.sh && cd ..
# fi

# docker compose -f docker-compose-airflow.yml up -d

# # # Run Spark Cluster
# if [[ "$PWD" != "spark" ]]; then
#   cd spark && ./start-cluster.sh && cd ..
# fi

echo "Current dir is $PWD"