FROM alpine:latest

RUN apk update \
&& apk add curl \
&& curl -sL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -xvz \
&& chmod 0755 cf \
&& mv cf /usr/local/bin
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
