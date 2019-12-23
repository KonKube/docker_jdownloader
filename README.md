# How to build

  * git clone https://github.com/KonKube/docker_jdownloader
  * cd docker_jdownloader
  * VERSION=v41643-20191222
  * docker buildx build --platform linux/amd64,linux/arm64 -t konkube/jdownloader:$VERSION . --push

## Source/Inspiration/Copied from :)

  * [jdownloader](http://jdownloader.org/)
  * [skywirex](https://github.com/skywirex/docker-jdownloader-2)

## Optional environment variables

Environment Variable | Description
---------------------|------------
EMAIL                | The MyJDownloader account e-mail.
PASSWORD             | The MyJDownloader account password.
