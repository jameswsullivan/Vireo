FROM ubuntu:22.04

ARG PLAY_FRAMEWORK_PATH
ARG VIREO_INSTALLATION_PATH

# Set locale to UTF8.
ENV DEBIAN_FRONTEND="noninteractive"
ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"

# Set Java timezone
ENV JAVA_OPTS="-Duser.timezone=America/Chicago"

ENV PLAY_PATH=${PLAY_FRAMEWORK_PATH}
ENV VIREO_PATH=${VIREO_INSTALLATION_PATH}
ENV PATH="$PATH:${PLAY_FRAMEWORK_PATH}"

COPY ./vireo ${VIREO_INSTALLATION_PATH}
COPY ./play ${PLAY_FRAMEWORK_PATH}
COPY ./vireo.entrypoint.sh /usr/bin/entrypoint.sh

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git nano curl unzip tzdata locales postgresql-client && \
    ln -fs /usr/share/zoneinfo/US/Central /etc/localtime && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 && \
    apt-get install openjdk-8-jdk python2.7 -y && \
    ln -s /usr/bin/python2.7 /usr/local/bin/python && \
    chmod +x /usr/bin/entrypoint.sh && \
    echo "export PATH=${PATH}:${PLAY_FRAMEWORK_PATH}" >> /root/.bashrc

RUN mkdir /vireo/attachments /vireo/deposits /vireo/indexes

WORKDIR ${VIREO_PATH}

RUN export PATH=$PATH:${PLAY_FRAMEWORK_PATH} && \
    play dependencies --sync --clearcache --%test

WORKDIR ${VIREO_PATH}

ENTRYPOINT [ "entrypoint.sh" ]
