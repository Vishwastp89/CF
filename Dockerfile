FROM alpine:latest

RUN apk update \
&& apk add curl \
&& curl -sL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -xvz \
&& ls \
&& chmod 0755 cf \
&& cp -var cf /usr/bin \
&& ls -ltrh /usr/bin/cf \
&& /usr/bin/cf version
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
