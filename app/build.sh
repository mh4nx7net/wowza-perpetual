#!/bin/bash
set -e

#source /etc/profile.d/jdk11.sh

check_and_install_wowza() {
	echo "Checking if Wowza Streaming Engine is installed..."
	if [[ -e /usr/local/WowzaStreamingEngine ]]; then
		echo "Installation found"
		return
	fi

	echo "No installation found"
	echo "Installing Wowza..."

	sed -i "s/WOUSER/${WO_USER}/g" /app/settings.h
	sed -i "s/WOPASS/${WO_PASS}/g" /app/settings.h
	sed -i "s/WOLICE/${WO_LICENSE}/g" /app/settings.h

  # install Wowza
  /app/interaction.exp

  #echo "${WO_LICENSE}" > /usr/local/WowzaStreamingEngine/conf/Server.license
  #cp /app/poc/updateavailable* /usr/local/WowzaStreamingEngine-4.8.0/manager/temp/webapps/enginemanager/WEB-INF/classes/org/apache/jsp/tag/web/wmsform/.
  #mkdir -p  /usr/local/WowzaStreamingEngine-4.8.0/manager/temp/webapps/enginemanager/WEB-INF/classes/org/apache/jsp/tag/web/wmsform/
  cp /app/poc/4.8.0/wms-server.jar /usr/local/WowzaStreamingEngine-4.8.0/lib/wms-server.jar

  #mv /usr/local/WowzaStreamingEngine/java /usr/local/WowzaStreamingEngine/java-ori
  #ln -sf /usr/lib/jvm/java-11-openjdk-amd64/ /usr/local/WowzaStreamingEngine/java

  # symlink /usr/local/WowzaStreamingEngine/logs -> ${WOWZA_LOG_DIR}/wowza
  rm -rf /usr/local/WowzaStreamingEngine/logs
  ln -sf ${WOWZA_LOG_DIR}/wowza /usr/local/WowzaStreamingEngine/logs

  # symlink /usr/local/WowzaStreamingEngine/manager/logs -> ${WOWZA_LOG_DIR}/manager
  rm -rf /usr/local/WowzaStreamingEngine/manager/logs
  ln -sf ${WOWZA_LOG_DIR}/manager /usr/local/WowzaStreamingEngine/manager/logs
}

if [[ ! -f /usr/local/WowzaStreamingEngine ]]; then
	check_and_install_wowza
fi
