#!/bin/sh

if [ ! -f /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json ]
then
  echo "{" > /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  echo "  \"password\" : \"$PASSWORD\"," >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  echo "  \"email\" : \"$EMAIL\"" >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  echo "}" >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
fi

java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar -norestart

sleep 30

java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar -norestart
