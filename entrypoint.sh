#!/bin/sh

echo "{" > /opt/jdownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
echo "  \"password\" : \"$PASSWORD\"," >> /opt/jdownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
echo "  \"email\" : \"$EMAIL\"" >> /opt/jdownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json
echo "}" >> /opt/jdownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json

java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -Djava.awt.headless=true ${VMARGS} -jar /opt/jdownloader/JDownloader.jar -norestart

sleep 10

java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -Djava.awt.headless=true ${VMARGS} -jar /opt/jdownloader/JDownloader.jar -norestart
