#!/usr/bin/env sh

emq_version="2.3.10"

echo "Install packages"
apt-get update
apt-get install make erlang rebar build-essential mongodb nodejs npm

echo "Install Node-Red"
npm install -g --unsafe-perm node-red

echo "Config Node-Red to autostart on boot"
cp nodered.service /lib/systemd/system/nodered.service
systemctl enable nodered.service

echo "Get source EMQ"
if [ -f "$file" ]
then
	echo "emq-relx/ found. Remove old."
	rm -r emq-relx
fi
git clone https://github.com/emqtt/emq-relx.git $emq_version
mv $emq_version emq-relx
