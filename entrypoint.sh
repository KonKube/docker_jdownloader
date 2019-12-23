#!/bin/sh

if [ ! -f /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json ]
then
  echo "{" > /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  echo "  \"password\" : \"$PASSWORD\"," >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  echo "  \"email\" : \"$EMAIL\"" >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  echo "}" >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
fi

"$@"

while sleep 3600; do :; done
