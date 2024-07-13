# Base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk wget tar

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Download and install Impala
RUN wget https://archive.apache.org/dist/impala/3.4.0/apache-impala-3.4.0-bin.tar.gz && \
    tar -xzvf apache-impala-3.4.0-bin.tar.gz && \
    mv apache-impala-3.4.0-bin /opt/impala

# Set Impala environment variables
ENV IMPALA_HOME=/opt/impala
ENV PATH=$IMPALA_HOME/bin:$PATH

# Copy configuration files (if any) and entrypoint script
COPY conf /opt/impala/conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose necessary ports
EXPOSE 21050 25020 24000

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
