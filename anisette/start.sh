#!/usr/bin/env bashio

echo "Loading configuration..."

echo "Importing libs from '/share/anisette/lib' ..."
cp -R /share/anisette/lib /opt/omnisette-server/lib

echo "Libs loaded: $(ls /opt/omnisette-server/lib/*/*)"

/opt/omnisette-server/omnisette-server 
