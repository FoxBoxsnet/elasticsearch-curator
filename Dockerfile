FROM python:2-alpine

MAINTAINER airforon <github@air-foron.com>

RUN \
       apk add --no-cache \
            bash \
    && pip install elasticsearch-curator

ADD docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "crond", "-l", "2". "-f" ]
