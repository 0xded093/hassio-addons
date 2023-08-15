#!/usr/bin/env bashio

bashio::log.info "Loading configuration..."

lib_path=$(bashio::config "lib_path")

bashio::log.info "Importing libs from '/share/anisette/lib' ..."
cp -R /share/anisette/lib /opt/omnisette-server/lib

bashio::log.info "Libs loaded: $(ls /opt/omnisette-server/lib/*/*)"

/opt/omnisette-server/omnisette-server 
