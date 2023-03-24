#!/usr/bin/env bashio

bashio::log.info "Loading configuration..."

url=$(bashio::config "url")
username=$(bashio::config "username")
password=$(bashio::config "password")

if [ "$1" == "deploy_challenge" ]
then
	echo "args $@"
	echo "filename: $3"
	echo "content: $4"
	curl -vvv -i -s -k -X $'POST' \
		-H $'Host: woohoo' -H $'Content-Type: application/x-www-form-urlencoded' \
		--data "username=$username&password=$password&filename=$3&content=$4" \
		$url
fi
