ARG JDK_VERSION=8u302-slim-buster
FROM openjdk:${JDK_VERSION}}

LABEL maintainer="konkube@gmail.com"

# set User and Group arguments
ARG JDOWNLOADER_HOME=/opt/JDownloader
ARG JDOWNLOADER_USER=jdownloader
ARG JDOWNLOADER_UID=1000
ARG JDOWNLOADER_GID=100

# update apt-get and install curl
RUN apt-get update && apt-get install -y curl

# create User with predefined arguments
RUN \
  adduser \
    --disabled-password \
    --disabled-login \
    --gecos '' \
    --home ${JDOWNLOADER_HOME} \
    --uid "${JDOWNLOADER_UID}" \
    --gid "${JDOWNLOADER_GID}" \
    --quiet \
    "${JDOWNLOADER_USER}"

# create JDownloader directories
RUN mkdir -p /opt/JDownloader/libs && \
  chown -R ${JDOWNLOADER_UID}:${JDOWNLOADER_GID} /opt/JDownloader

# download JDownloader.jar and set right permissions for JDownloader.jar
RUN curl \
    --silent \
    --location \
    --retry 3 \
    --output /opt/JDownloader/JDownloader.jar \
    "http://installer.jdownloader.org/JDownloader.jar" && \
    chown ${JDOWNLOADER_UID}:${JDOWNLOADER_GID} /opt/JDownloader/JDownloader.jar && \
    chmod 755 /opt/JDownloader/JDownloader.jar

# apt-get clenaup after install
RUN apt-get purge -y curl && apt-get autoremove -y && apt-get autoclean

USER ${JDOWNLOADER_USER}

WORKDIR /opt/JDownloader/

COPY ./entrypoint.sh /opt/JDownloader/entrypoint.sh

ENTRYPOINT ["/opt/JDownloader/entrypoint.sh"]
