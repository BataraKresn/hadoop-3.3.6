#!/bin/bash

# Function to remove a Docker image if it exists
remove_docker_image() {
  if docker image inspect "$1" > /dev/null 2>&1; then
    docker image rm "$1"
    echo "Image '$1' berhasil dihapus."
  else
    echo "Image '$1' tidak ditemukan."
  fi
}

# Remove Docker images
# remove_docker_image "hadoop-base:3.3.6"
remove_docker_image "hadoop-nodemanager:1.0.0"
remove_docker_image "hadoop-resourcemanager:1.0.0"
remove_docker_image "hadoop-datanode1:1.0.0"
remove_docker_image "hadoop-datanode2:1.0.0"
remove_docker_image "hadoop-datanode3:1.0.0"
remove_docker_image "hadoop-namenode:1.0.0"
remove_docker_image "hadoop-historyserver:1.0.0"
# remove_docker_image "hive-hadoop-3.3.6:1.0.0"
# remove_docker_image "hive-metastore:1.0.0"
# remove_docker_image "hive-server:1.0.0"
# remove_docker_image "hive-webhcat:1.0.0"
# remove_docker_image "hue:1.0.0"
# remove_docker_image "spark-base:3.5.1"
# remove_docker_image "livy:1.0.0"
# remove_docker_image "postgresdb:11.4-alpine"