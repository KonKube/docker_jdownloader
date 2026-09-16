#!/bin/sh

# download JDownloader.jar and set right permissions
curl --output $JDOWNLOADER_APP/JDownloader.jar $JDOWNLOADER_URL
chmod 755 $JDOWNLOADER_APP/JDownloader.jar

# prepare and set JDownloader settings
if [ ! -f "$JDOWNLOADER_APP/cfg/$JDOWNLOADER_SETTINGS" ]; then
    cp $JDOWNLOADER_APP/$JDOWNLOADER_SETTINGS $JDOWNLOADER_APP/cfg/$JDOWNLOADER_SETTINGS
    sed -Ei "s/DUMMYDEVICE/$DEVICE/g" $JDOWNLOADER_APP/cfg/$JDOWNLOADER_SETTINGS
    sed -Ei "s/DUMMYMAIL/$EMAIL/g" $JDOWNLOADER_APP/cfg/$JDOWNLOADER_SETTINGS
    sed -Ei "s/DUMMYPASS/$PASSWORD/g" $JDOWNLOADER_APP/cfg/$JDOWNLOADER_SETTINGS
fi

# run for update
java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -Djava.awt.headless=true ${VMARGS} -jar $JDOWNLOADER_APP/JDownloader.jar -norestart

# sleep
sleep 5

# run for service
java -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 -Djava.awt.headless=true ${VMARGS} -jar $JDOWNLOADER_APP/JDownloader.jar -norestart
