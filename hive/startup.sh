#!/bin/bash

# Set error handling
set -e

# Initialize Hive schema
/opt/hive/bin/schematool -dbType postgres -initSchema

# Create HDFS directories for Hive
hdfs dfs -mkdir -p /tmp
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /tmp
hdfs dfs -chmod g+w /user/hive/warehouse

# Start Hive Metastore
/opt/hive/bin/hive --service metastore &

# Wait for Hive Metastore to be ready
sleep 10

# Start HiveServer2
cd ${HIVE_HOME}/bin
./hiveserver2 --hiveconf hive.server2.enable.doAs=false --hiveconf hive.root.logger=DEBUG,console
