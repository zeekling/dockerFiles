FROM ubuntu:xenial

MAINTAINER lingzhaohui@zeekling.cn 

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN mkdir -p /usr/src/app 

ADD . /usr/src/app 

WORKDIR /usr/src/app 

RUN mv node-v16.16.0-linux-x64 /opt/node-v16.16.0 

RUN echo NODE_HOME="/opt/node-v16.16.0" >> ~/.profile && echo PATH=$PATH:$NODE_HOME/bin >> ~/.profile 

RUN export NODE_HOME="/opt/node-v16.16.0" && export PATH=$PATH:$NODE_HOME/bin && echo $PATH

RUN whereis node && ls /opt/node-v16.16.0/bin/node

RUN  /opt/node-v16.16.0/bin/node -v 

RUN /opt/node-v16.16.0/bin/npm -v

RUN /opt/node-v16.16.0/bin/npm install -g webpack 
RUN /opt/node-v16.16.0/bin/npm install yarn 

EXPOSE 4000

CMD ["yarn","bestart"]

