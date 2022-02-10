FROM ubuntu:latest

WORKDIR /
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -xvz
RUN cp cf8 /user/local/bin
RUN cp cf /user/local/bin
RUN ls -ltrh
RUN curl -o /usr/share/bash-completion/completions/cf8 https://raw.githubusercontent.com/cloudfoundry/cli-ci/master/ci/installers/completion/cf8
RUN cf version
RUN chmod +x entrypoint.sh
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
