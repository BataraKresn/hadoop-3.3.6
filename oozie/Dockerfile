# Base image with Java 8 JDK
FROM openjdk:8-jdk

# Set environment variables
ENV OOZIE_VERSION=5.2.1
ENV HADOOP_VERSION=3.3.6
ENV OOZIE_HOME=/opt/oozie
ENV OOZIE_DATA=/opt/oozie/data
ENV OOZIE_URL=http://archive.apache.org/dist/oozie/${OOZIE_VERSION}/oozie-${OOZIE_VERSION}.tar.gz

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget tar python3 python3-pip maven && \
    apt-get clean

# Download and extract Oozie
RUN wget ${OOZIE_URL} -O /tmp/oozie.tar.gz && \
    mkdir -p ${OOZIE_HOME} && \
    tar -xzf /tmp/oozie.tar.gz -C ${OOZIE_HOME} --strip-components=1 && \
    rm /tmp/oozie.tar.gz

# Add custom Maven settings file
COPY settings.xml /usr/share/maven/ref/

# Build Oozie with PostgreSQL support
RUN cd ${OOZIE_HOME} && \
    mvn clean package assembly:single -DskipTests -DjavaVersion=8 -Poozie,hadoop-3,postgresql --settings /usr/share/maven/ref/settings.xml

# Copy Oozie binaries to /opt
RUN tar -xzf ${OOZIE_HOME}/distro/target/oozie-${OOZIE_VERSION}-distro.tar.gz -C /opt && \
    mv /opt/oozie-${OOZIE_VERSION} /opt/oozie && \
    rm -rf ${OOZIE_HOME}/distro/target

# Copy Oozie configuration files
COPY oozie-site.xml ${OOZIE_HOME}/conf/
COPY oozie-env.sh ${OOZIE_HOME}/bin/

# Set up PostgreSQL JDBC driver
RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.19.jar -O ${OOZIE_HOME}/libext/postgresql-42.2.19.jar

# Prepare Oozie database
RUN ${OOZIE_HOME}/bin/ooziedb.sh create -sqlfile ${OOZIE_HOME}/oozie.sql -run

# Expose ports
EXPOSE 11000

# Start Oozie
CMD ["sh", "-c", "${OOZIE_HOME}/bin/oozied.sh start && tail -f ${OOZIE_HOME}/oozie.log"]
