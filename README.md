# How to build

  * VERSION=v41643-20191222
  * docker buildx build --platform linux/amd64,linux/arm64 -t konkube/jdownloader:$VERSION . --push

## Source/Inspiration/Copied from :)

  * [jdownloader](http://jdownloader.org/)
  * [skywirex](https://github.com/skywirex/docker-jdownloader-2)

## Optional environment variables

Environment Variable | Description
---------------------|------------
EMAIL                | The MyJDownloader account e-mail. Is written automatically to config-file, if set.
PASSWORD             | The MyJDownloader account password. Is written automatically to config-file, if set.
