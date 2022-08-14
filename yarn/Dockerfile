FROM ubuntu:xenial

MAINTAINER lingzhaohui@zeekling.cn 

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && sed -i s@/security.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN mkdir -p /usr/src/app 

# ADD . /usr/src/app 

WORKDIR /usr/src/app 

RUN apt update

RUN apt install apt-transport-https ca-certificates -y

RUN apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt update

RUN apt install nodejs npm yarn -y

RUN  node -v 

RUN npm -v

RUN npm install -g webpack 
RUN npm install yarn 

EXPOSE 4000

CMD ["yarn","bestart"]

