# build from hadoop-base:3.2.1
# that we built before using docker build -t hadoop-base:3.2.1 .
# FROM hadoop-base:3.3.6
FROM hadoop-spark-java-python:3.3.6

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
