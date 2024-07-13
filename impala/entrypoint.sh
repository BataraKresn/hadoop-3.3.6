#!/bin/bash

# Start State Store
$IMPALA_HOME/bin/statestored -log_dir=/var/log/impala &

# Start Catalog Service
$IMPALA_HOME/bin/catalogd -log_dir=/var/log/impala &

# Start Impala Daemon
$IMPALA_HOME/bin/impalad -log_dir=/var/log/impala -catalog_service_host=catalog-server -state_store_host=statestore &

# Keep the container running
tail -f /dev/null
