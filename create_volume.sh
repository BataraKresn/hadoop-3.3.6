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
  "/bigdata/hadoop_namenode"
  "/bigdata/hadoop_datanode1"
  "/bigdata/hadoop_datanode2"
  "/bigdata/hadoop_datanode3"
  "/bigdata/hadoop_namenager_local"
  "/bigdata/hadoop_namenager_logs"
  "/bigdata/hadoop_historyserver"
  "/bigdata/airflow/output"
  "/bigdata/airflow/plugins"
  "/bigdata/airflow/logs"
  "/bigdata/airflow/logs/scheduler"
  "/bigdata/spark/apps"
  "/bigdata/spark/data"
  "/bigdata/redis/data"

#   "/bigdata/hue_data"
#   "/bigdata/redis/data"
#   "/bigdata/livy/target/"
#   "/bigdata/livy/data/"
#   "/bigdata/postgresdb/data"
#   "/bigdata/postgresdb/logs"
#   "/bigdata/huedb/data"

)

# Loop through the list and create each directory if needed
for dir in "${directories[@]}"; do
  create_directory "$dir"
done

# Change ownership and permissions
sudo chown airflow:root -R /bigdata/
echo "Ownership is done."

sudo chmod -R 777 /bigdata/
echo "All Access"