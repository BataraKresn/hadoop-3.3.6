#!/bin/bash

# Initialize the Oozie database
$OOZIE_HOME/bin/ooziedb.sh create -sqlfile oozie.sql -run

# Start Oozie
exec "$@"
