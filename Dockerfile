#FROM	debian:buster-slim
FROM	ubuntu:18.04
MAINTAINER sandiko@kopikonfig.com
ENV	HOSTNAME="stream.kopikonfig.com"
ENV	TZ="Asia/Jakarta"

ENV	WOWZA_VERSION=4.8.0 \
	WOWZA_DATA_DIR=/var/lib/wowza \
	WOWZA_LOG_DIR=/var/log/wowza \
	WO_USER=admin \
	WO_PASS=admin \
	WO_LICENSE=ET1A4-KxrGd-Eaj9T-dTbcf-rZNza-9xaJd
	
RUN	apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y wget supervisor expect\
	&& apt clean && rm -rf /var/lib/apt/lists/*

COPY	app /app
COPY	poc /app/poc

RUN	/app/prepare.sh
RUN	/app/build.sh


RUN	mv /app/entrypoint.sh /sbin/entrypoint.sh
RUN	chmod 755 /sbin/entrypoint.sh

EXPOSE	1935/tcp 8086/tcp 8087/tcp 8088/tcp
VOLUME	["${WOWZA_DATA_DIR}", "${WOWZA_LOG_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
