FROM maven:3-jdk-8-slim

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

RUN addgroup --gid ${gid} ${group} && \
    adduser --system --home /home/${user} --uid ${uid} --gid ${gid} --disabled-password ${user} && \
    apt update && \
    apt install -y git openssh-client apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install docker-ce-cli

USER ${user}
WORKDIR /home/${user}
