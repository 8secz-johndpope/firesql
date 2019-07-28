FROM python:rc-alpine

RUN set -xe \
    && apk add --no-cache --virtual .build-deps git gcc musl-dev \
    && pip3 install --no-cache-dir python-socketio eventlet \
    && git clone https://github.com/GitHub30/python-mysql-replication firesql \
    && git clone https://github.com/howmp/python-mysql-replication \
    && cd python-mysql-replication \
    && python setup.py install \
    && cd .. \
    && rm -rf python-mysql-replication \
    && apk del .build-deps

CMD ["python", "/firesql/examples/sync_server.py"]
