#!/usr/bin/env sh

echo "Install packages"
sudo apt-get update
sudo apt-get install make erlang rebar build-essential


echo "Get source"
file="emq-relx"
if [ -f "$file" ]
then
	echo "$file found."
else
	echo "$file not found."
fi
