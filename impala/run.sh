#!/bin/bash

create_directory() {
  if [ -d "$1" ]; then
    echo "Folder '$1' sudah ada."
  else
    sudo mkdir -p "$1"
    echo "Folder '$1' telah dibuat."
  fi
}

# List of directories to create
directories=(
  "/home/bdata/bigdata-file/impala/impala-logs"
)

# Loop through the list and create each directory if needed
for dir in "${directories[@]}"; do
  create_directory "$dir"
done

# Change ownership and permissions
sudo chown airflow:root -R /home/bdata/bigdata-file/impala/impala-logs
echo "Ownership is done."

sudo chmod -R 777 /home/bdata/bigdata-file/impala/impala-logs
echo "All Access"

# Build images
docker build -t impala:latest .

docker-compose up -d

# Verify the Setup:
# Access Impala using impala-shell from the impala-daemon container:
# docker exec -it impala-daemon impala-shell -q "SHOW DATABASES;"