FROM ubuntu:latest

WORKDIR /
RUN apt-get update \
&& apt-get install -y curl \
&& apt-get install -y wget
#RUN curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" \
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN ls -ltrh \
&& tar -xvzf /cf8-cli_8.1.0_linux_x86-64.tgz \
&& mv /cf8 /usr/local/bin \
&& mv /cf /usr/local/bin \
&& ls -ltrh /usr/local/bin \
&& curl -o /usr/share/bash-completion/completions/cf8 https://raw.githubusercontent.com/cloudfoundry/cli-ci/master/ci/installers/completion/cf8 \
&& cf version
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
