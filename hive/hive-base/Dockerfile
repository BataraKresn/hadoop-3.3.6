# FROM hadoop-base:3.3.6
FROM hadoop-spark-java-python:3.3.6
LABEL maintainer="SAT"

ARG HIVE_VERSION
ENV HIVE_VERSION=${HIVE_VERSION:-3.1.3}
ENV HIVE_HOME=/opt/hive
ENV PATH=${HIVE_HOME}/bin:$PATH
ENV HADOOP_HOME=/opt/hadoop-3.3.6
ENV HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

WORKDIR /opt

COPY apache-hive-3.1.3-bin.tar.gz /tmp/
# COPY jdk-8u131-linux-x64.tar.gz /tmp/
# Install Hive and PostgreSQL JDBC
# RUN apt-get update && apt-get install -y wget netcat-openbsd procps && \
# 	wget https://dlcdn.apache.org/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
# 	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
# 	mv apache-hive-$HIVE_VERSION-bin hive && \
# 	wget https://jdbc.postgresql.org/download/postgresql-42.1.4.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar && \
# 	rm apache-hive-$HIVE_VERSION-bin.tar.gz && \
# 	apt-get --purge remove -y wget && \
# 	apt-get clean && \
# 	rm -rf /var/lib/apt/lists/*

# Install Java 8 JDK
RUN apt-get update && apt-get install -y wget netcat-openbsd net-tools procps && \
    tar -xzvf /tmp/apache-hive-3.1.3-bin.tar.gz -C /opt/ && \
    # tar -xzvf /tmp/jdk-8u131-linux-x64.tar.gz -C /opt/ && \
    # mv /opt/jdk1.8.0_131 /opt/jdk8 && \
    mv /opt/apache-hive-$HIVE_VERSION-bin /opt/hive && \
    wget https://jdbc.postgresql.org/download/postgresql-42.1.4.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar && \
    # rm -rf /tmp/jdk-8u131-linux-x64.tar.gz && \
    rm -rf /tmp/apache-hive-3.1.3-bin.tar.gz && \
    apt-get --purge remove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
# ENV JAVA_HOME=/opt/jdk8
# ENV PATH=$JAVA_HOME/bin:$PATH

# Spark should be compiled with Hive to be able to use it
# hive-site.xml should be copied to $SPARK_HOME/conf folder

# # ** Add this line to ensure netcat is installed
# RUN apt-get update
# RUN apt-get -y upgrade
# RUN apt-get  install -y netcat \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

COPY conf/ ${HIVE_HOME}/conf/

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 10000
EXPOSE 10002

ENTRYPOINT [ "./entrypoint.sh" ]