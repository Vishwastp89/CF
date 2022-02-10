FROM ubuntu:latest

WORKDIR /
RUN apt-get update \
&& apt-get install -y curl \
&& curl -sL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -xvz \
&& mv /cf8 /usr/local/bin \
&& mv /cf /usr/local/bin \
&& ls -ltrh /usr/local/bin \
&& curl -o /usr/share/bash-completion/completions/cf8 https://raw.githubusercontent.com/cloudfoundry/cli-ci/master/ci/installers/completion/cf8 \
&& cf version
ADD entrypoint.sh /entrypoint.sh
chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
