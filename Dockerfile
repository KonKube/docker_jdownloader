ARG IMAGE_VERSION=21-jre-jammy
FROM eclipse-temurin:${IMAGE_VERSION}

ARG TARGETARCH

LABEL maintainer="konkube@gmail.com"

# set User and Group and download arguments
ARG JDOWNLOADER_HOME=/opt/jdownloader
ARG JDOWNLOADER_USER=jdownloader
ARG JDOWNLOADER_UID=1004
ARG JDOWNLOADER_GID=100
ARG JDOWNLOADER_URL="http://installer.jdownloader.org/JDownloader.jar"

# create User with predefined arguments
RUN useradd \
    --uid "${JDOWNLOADER_UID}" \
    --gid "${JDOWNLOADER_GID}" \
    --home-dir "${JDOWNLOADER_HOME}" \
    --create-home \
    --shell /usr/sbin/nologin \
    "${JDOWNLOADER_USER}"

# create JDownloader directories
RUN mkdir -p ${JDOWNLOADER_HOME}/libs && mkdir -p ${JDOWNLOADER_HOME}/cfg && \
  chown -R ${JDOWNLOADER_UID}:${JDOWNLOADER_GID} ${JDOWNLOADER_HOME}

# download JDownloader.jar and set right permissions for JDownloader.jar
RUN curl \
    --silent \
    --location \
    --retry 3 \
    --output ${JDOWNLOADER_HOME}/JDownloader.jar \
    ${JDOWNLOADER_URL} && \
    chown ${JDOWNLOADER_UID}:${JDOWNLOADER_GID} ${JDOWNLOADER_HOME}/JDownloader.jar && \
    chmod 755 ${JDOWNLOADER_HOME}/JDownloader.jar

USER ${JDOWNLOADER_USER}

WORKDIR ${JDOWNLOADER_HOME}

COPY ./entrypoint.sh ${JDOWNLOADER_HOME}/entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
