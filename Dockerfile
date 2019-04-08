FROM maven:3-jdk-8-alpine

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

RUN addgroup -g ${gid} ${group} && \
    adduser -h /home/${user} -u ${uid} -G ${group} -D ${user} && \
    apk add --no-cache --update git openssh-client docker

USER ${user}
WORKDIR /home/${user}

