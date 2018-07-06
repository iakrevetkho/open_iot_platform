#!/usr/bin/env sh

echo "****************************************************************************************************************"
echo "Install packages"
apt-get update
apt-get install make erlang rebar build-essential mongodb nodejs npm

echo "****************************************************************************************************************"
echo "Install Node-Red"
npm install -g --unsafe-perm node-red

echo "****************************************************************************************************************"
echo "Config Node-Red to autostart on boot"
cp nodered.service /lib/systemd/system/nodered.service
systemctl enable nodered.service
echo "****************************************************************************************************************"
echo "Start Node-Red service"
sudo service nodered start

echo "****************************************************************************************************************"
echo "Install Grafana service"
apt-get install grafana
echo "****************************************************************************************************************"
echo "Start Grafana service"
sudo service grafana-server start

echo "****************************************************************************************************************"
echo "Get source EMQ"
if [ -d "emq-relx/" ]
then
	echo "emq-relx/ found. Remove old."
	rm -r emq-relx
fi
git clone https://github.com/emqtt/emq-relx.git

echo "****************************************************************************************************************"
echo "Modify emq-relx Makefile"
#sudo sed -i 's/DEPS += \+/DEPS += emq_mongo_plugin /' emq-relx/Makefile

#echo "DEPS += emq_mongo_plugin" >> emq-relx/Makefile
#echo "dep_emq_mongo_plugin = https://github.com/iakrevetkho/emq_mqtt_to_mongodb.git" >> emq-relx/Makefile


