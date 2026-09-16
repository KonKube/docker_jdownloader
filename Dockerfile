ARG IMAGE_VERSION=21-jre-jammy
FROM eclipse-temurin:${IMAGE_VERSION}

LABEL maintainer="konkube@gmail.com"

# set build arguments
ARG JDOWNLOADER_HOME=/opt/JDownloader
ARG JDOWNLOADER_USER=jdownloader
ARG JDOWNLOADER_UID=1004
ARG JDOWNLOADER_GID=100
ARG JDOWNLOADER_SETTINGS=org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json

# set entrypoint environment variables
ENV JDOWNLOADER_APP="${JDOWNLOADER_HOME}/app"
ENV JDOWNLOADER_URL="http://installer.jdownloader.org/JDownloader.jar"
ENV JDOWNLOADER_UID="${JDOWNLOADER_UID}"
ENV JDOWNLOADER_GID="${JDOWNLOADER_GID}"
ENV JDOWNLOADER_SETTINGS="${JDOWNLOADER_SETTINGS}"

# create user with predefined arguments
RUN useradd \
    --uid "${JDOWNLOADER_UID}" \
    --gid "${JDOWNLOADER_GID}" \
    --home-dir "${JDOWNLOADER_HOME}" \
    --create-home \
    --shell /usr/sbin/nologin \
    "${JDOWNLOADER_USER}"

# run as jdownlaoder user
USER ${JDOWNLOADER_USER}

# create app directory
RUN mkdir -p /opt/JDownloader/app/

# set workdir
WORKDIR ${JDOWNLOADER_HOME}

# copy JDownloader settings file and entrypoint-script
COPY ./${JDOWNLOADER_SETTINGS} ${JDOWNLOADER_HOME}/app/${JDOWNLOADER_SETTINGS}
COPY ./entrypoint.sh ${JDOWNLOADER_HOME}/entrypoint.sh

# set entrypoint
ENTRYPOINT ["./entrypoint.sh"]