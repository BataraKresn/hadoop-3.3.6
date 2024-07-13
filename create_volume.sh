# Function to create a directory if it doesn't exist
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
  "/home/bdata/bigdata-file/hadoop_namenode"
  "/home/bdata/bigdata-file/hadoop_datanode1"
  "/home/bdata/bigdata-file/hadoop_datanode2"
  "/home/bdata/bigdata-file/hadoop_datanode3"
  "/home/bdata/bigdata-file/hadoop_namenager_local"
  "/home/bdata/bigdata-file/hadoop_namenager_logs"
  "/home/bdata/bigdata-file/hadoop_historyserver"
  # "/home/bdata/bigdata-file/airflow/output"
  # "/home/bdata/bigdata-file/airflow/plugins"
  # "/home/bdata/bigdata-file/airflow/logs"
  # "/home/bdata/bigdata-file/airflow/logs/scheduler"
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

# Loop through the list and create each directory if needed
for dir in "${directories[@]}"; do
  create_directory "$dir"
done

# Change ownership and permissions
sudo chown airflow:root -R /home/bdata/bigdata-file/
echo "Ownership is done."

sudo chmod -R 777 /home/bdata/bigdata-file/
echo "All Access"