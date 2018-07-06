#!/usr/bin/env sh


echo "Install packages"
apt-get update
apt-get install make erlang rebar build-essential mongodb nodejs npm

echo "Install Node-Red"
npm install -g --unsafe-perm node-red

echo "Config Node-Red to autostart on boot"
cp nodered.service /lib/systemd/system/nodered.service
systemctl enable nodered.service

echo "Get source EMQ"
file="emq-relx"
if [ -f "$file" ]
then
	echo "$file found. Remove old."
	rm -r $file
fi
git clone https://github.com/emqtt/emq-relx.git 2.3.10
