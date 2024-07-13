# Use a base image with Java and Hadoop installed
FROM hadoop-spark-java-python:3.3.6

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Set Oozie version and download URL
ARG OOZIE_VERSION=5.2.1
ARG OOZIE_URL=http://archive.apache.org/dist/oozie/${OOZIE_VERSION}/oozie-${OOZIE_VERSION}.tar.gz

# Download and install Oozie
RUN wget ${OOZIE_URL} && \
    tar -xzf oozie-${OOZIE_VERSION}.tar.gz -C /opt && \
    rm oozie-${OOZIE_VERSION}.tar.gz && \
    mv /opt/oozie-${OOZIE_VERSION} /opt/oozie

# Set environment variables
ENV OOZIE_HOME=/opt/oozie
ENV OOZIE_CONF=${OOZIE_HOME}/conf
ENV CATALINA_OPTS="-Xmx1024m"

# Configure Oozie
WORKDIR ${OOZIE_HOME}

# Add configuration files
ADD oozie-site.xml ${OOZIE_CONF}/oozie-site.xml

# Build Oozie
RUN bin/mkdistro.sh -DskipTests

# Expose Oozie port
EXPOSE 11000

# Start Oozie
CMD ["bin/oozied", "start"]
