FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive


RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt clean

RUN apt update

RUN apt install -y ntp python-dev python-pip python-wheel python-setuptools python-pkg-resources krb5-admin-server krb5-kdc

RUN apt install vim -y

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/supervisord/

RUN mkdir /app/

RUN pip install supervisor==4.2.4

COPY ./server/krb5.conf /etc/krb5kdc/kdc.conf

COPY ./server/kadm5.acl /etc/krb5kdc/kadm5.acl

COPY ./client/krb5.conf /etc/krb5.conf

COPY ./start.sh /app/start.sh

COPY ./supervisord.conf /etc/supervisord.conf

WORKDIR /app

CMD ["/bin/bash", "/app/start.sh"]


