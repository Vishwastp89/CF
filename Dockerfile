FROM alpine:latest

RUN apk update
RUN apk add curl
RUN curl -sL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -xvz
RUN pwd
RUN chmod 0755 cf
RUN cf version
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
