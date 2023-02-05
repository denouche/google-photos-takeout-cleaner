FROM debian:11

RUN apt-get update && apt-get install -y wget curl
RUN curl -s https://api.github.com/repos/TheLastGimbus/GooglePhotosTakeoutHelper/releases/latest | grep "browser_download_url.*linux" | cut -d : -f 2,3 | tr -d '"' | wget -qi -
RUN chmod +x gpth-linux
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
