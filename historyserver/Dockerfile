# build from hadoop-base:3.3.6 if your architectur is AMD64
# that we built before using docker build -t hadoop-base:3.3.6 .
# FROM bde2020/hadoop-base:2.0.0-hadoop3.2.1-java8
# FROM hadoop-base:3.3.6
FROM hadoop-spark-java-python:3.3.6

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]
