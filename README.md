# open_iot_platform
Open source iot platform

This is project that deploy iot platform based on EMQTT to your system.

Install required deps:
**sudo apt-get update
sudo apt-get install make erlang rebar build-essential mongodb nodejs**


Install MongoDB:
- Add key: **sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927**

Install Node-Red:
**sudo npm install -g --unsafe-perm node-red**

Get newest EMQ src
**git clone https://github.com/emqtt/emq-relx.git**

Modify MakeFile:
- Add to DEP: **DEPS += emq_mqtt_to_mongodb**
- Add plugin dependency: **dep_emq_mqtt_to_mongodb = https://github.com/iakrevetkho/emq_mqtt_to_mongodb.git**

Modify relx.conf:
- Add plugin load line: **{emq_mqtt_to_mongodb, load},**

Build EMQ with following command:
**cd emq-relx && make**

