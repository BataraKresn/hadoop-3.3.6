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


# Function to remove a directory if it exists
remove_directory() {
  if [ -d "$1" ]; then
    sudo rm -rf "$1"
    echo "Folder '$1' berhasil dihapus."
  else
    echo "Folder '$1' tidak ditemukan."
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
remove_docker_image "hive-hadoop-3.3.6:1.0.0"
remove_docker_image "hive-metastore:1.0.0"
remove_docker_image "hive-server:1.0.0"
remove_docker_image "hive-webhcat:1.0.0"
remove_docker_image "hue:1.0.0"
remove_docker_image "spark-base:3.5.1"
remove_docker_image "livy:1.0.0"
remove_docker_image "postgresdb:11.4-alpine"

# List of directories to remove
directories=(
  "/home/bdata/bigdata-file/hadoop_namenode"
  "/home/bdata/bigdata-file/hadoop_datanode1"
  "/home/bdata/bigdata-file/hadoop_datanode2"
  "/home/bdata/bigdata-file/hadoop_datanode3"
  "/home/bdata/bigdata-file/hadoop_namenager_local"
  "/home/bdata/bigdata-file/hadoop_namenager_logs"
  "/home/bdata/bigdata-file/hadoop_historyserver"
  "/home/bdata/bigdata-file/spark/apps"
  "/home/bdata/bigdata-file/spark/data"
  "/home/bdata/bigdata-file/redis/data"
  "/home/bdata/bigdata-file/livy/target/"
  "/home/bdata/bigdata-file/livy/data/"
  "/home/bdata/bigdata-file/postgresdb/data"
  "/home/bdata/bigdata-file/postgresdb/logs"
  "/home/bdata/bigdata-file/huedb/data"
  "/home/bdata/bigdata-file/hue_data"
)

# Loop through the list and attempt to remove each directory
for dir in "${directories[@]}"; do
  remove_directory "$dir"
done
