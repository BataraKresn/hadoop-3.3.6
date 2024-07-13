# Use the Hue base image
FROM gethue/hue:4.10.0

# Switch to root user
USER root

# Disable the NodeSource repository temporarily
RUN mv /etc/apt/sources.list.d/nodesource.list /etc/apt/sources.list.d/nodesource.list.disabled

# Update package lists and upgrade installed packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    build-essential \
    ca-certificates \
    libgnutls30 \
    thrift-compiler \
    iputils-ping \
    git \
    curl \
    postgresql-client \
    netcat \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Download and install prebuilt Thrift binaries
# RUN curl -o /usr/local/bin/thrift https://archive.apache.org/dist/thrift/0.14.1/thrift-0.14.1-bin.tar.gz && \
#     tar -xzf thrift-0.14.1-bin.tar.gz -C /usr/local/bin/ && \
#     rm thrift-0.14.1-bin.tar.gz

# Install Thrift from source
# RUN git clone https://github.com/apache/thrift.git && \
#     cd thrift && \
#     ./bootstrap.sh && \
#     ./configure --without-python && \
#     make && \
#     make install && \
#     cd .. && \
#     rm -rf thrift

# Re-enable the NodeSource repository
RUN mv /etc/apt/sources.list.d/nodesource.list.disabled /etc/apt/sources.list.d/nodesource.list

# Install PostgreSQL client and psycopg2
RUN /usr/share/hue/build/env/bin/pip install psycopg2-binary

# Copy the Hue configuration file to the container
COPY hue.ini /hue/desktop/conf/

# Set environment variables for PostgreSQL connection
ENV HUE_DATABASE_ENGINE=postgresql
ENV HUE_DATABASE_HOST=huedb
ENV HUE_DATABASE_PORT=5432
ENV HUE_DATABASE_USERNAME=hue
ENV HUE_DATABASE_PASSWORD=hue123
ENV HUE_DATABASE_NAME=hue

# Add environment variables for Django settings
ENV DJANGO_SETTINGS_MODULE=desktop.settings
ENV DEFAULT_AUTO_FIELD=django.db.models.BigAutoField

# Copy the entrypoint script and make it executable
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Expose the Hue default port
EXPOSE 8888

# Define the default command
CMD ["./startup.sh"]
