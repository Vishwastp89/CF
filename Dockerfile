FROM ubuntu:latest

WORKDIR /
RUN apt-get update
RUN apt-get install curl
RUN curl -sL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -xvz
RUN cp /cf /usr/bin/cf
RUN cp /cf8 /usr/bin/cf8
RUN chmod +x entrypoint.sh
RUN cf version
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
