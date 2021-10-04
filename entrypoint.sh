#!/bin/sh

if [ ! -f /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json ]
then
  if [[ ! -z $PASSWORD ]] && [[ ! -z $EMAIL ]] 
  then 
    echo "{" > /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
    echo "  \"password\" : \"$PASSWORD\"," >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
    echo "  \"email\" : \"$EMAIL\"" >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
    echo "}" >> /opt/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
  else 
    echo "Environment variable for Password or Email is missing"
  fi
fi

java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar -norestart

sleep 30

java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.awt.headless=true -jar /opt/JDownloader/JDownloader.jar -norestart
