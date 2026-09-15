#!/bin/sh

JDOWNLOADER_HOME=/opt/JDownloader

echo "{" > $JDOWNLOADER_HOME/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
echo "  \"password\" : \"$PASSWORD\"," >> $JDOWNLOADER_HOME/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
echo "  \"email\" : \"$EMAIL\"" >> $JDOWNLOADER_HOME/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
echo "}" >> $JDOWNLOADER_HOME/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json

java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -Djava.awt.headless=true ${VMARGS} -jar $JDOWNLOADER_HOME/JDownloader.jar -norestart

sleep 10

java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -Djava.awt.headless=true ${VMARGS} -jar $JDOWNLOADER_HOME/JDownloader.jar -norestart
