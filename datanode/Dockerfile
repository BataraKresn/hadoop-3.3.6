# build from hadoop-base:3.2.1
# that we built before using docker build -t hadoop-base:3.3.6 .
# FROM hadoop-base:3.3.6
FROM hadoop-spark-java-python:3.3.6

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9864

CMD ["/run.sh"]
