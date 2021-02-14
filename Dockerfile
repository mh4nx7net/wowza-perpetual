FROM	ubuntu
MAINTAINER sandiko@kopikonfig.com

ENV	WOWZA_VERSION=4.8.0 \
	WOWZA_DATA_DIR=/var/lib/wowza \
	WOWZA_LOG_DIR=/var/log/wowza \
	WO_USER=admin \
	WO_PASS=lanis12345 \
	WO_LICENSE=ET1A4-KxrGd-Eaj9T-dTbcf-rZNza-9xaJd
	
RUN	apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y wget supervisor openjdk-11-jdk expect \
	&& rm -rf /var/lib/apt/lists/*

COPY	app /app
RUN	/app/prepare.sh

RUN	mv /app/entrypoint.sh /sbin/entrypoint.sh
RUN	chmod 755 /sbin/entrypoint.sh

EXPOSE	1935/tcp 8086/tcp 8087/tcp 8088/tcp
VOLUME	["${WOWZA_DATA_DIR}", "${WOWZA_LOG_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
