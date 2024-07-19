FROM hadoop-spark-java-python-hive1:3.3.6

# Copy the startup script into the container
COPY startup.sh /opt/hive/startup.sh

# Make the startup script executable
RUN chmod +x /opt/hive/startup.sh

# Set up the health check for the Hive metastore service
HEALTHCHECK CMD netstat -tuplen | grep 9083 || exit 1

# Expose the port for the Hive metastore service
EXPOSE 9083

# Define the startup command
CMD ["/opt/hive/startup.sh"]
