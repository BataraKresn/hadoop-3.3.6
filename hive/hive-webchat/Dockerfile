FROM hive-hadoop-3.3.6:1.0.0

COPY startup.sh .

ENV PYTHON_CMD=/usr/bin/python

RUN chmod +x startup.sh

EXPOSE 50111

CMD [ "./startup.sh" ]