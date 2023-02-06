#!/usr/bin/env bashio

bashio::log.info "Loading configuration..."

save_path=$(bashio::config "save_path")
include_betas=$(bashio::config "include_betas")

cat >blobs.xml <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE preferences SYSTEM "http://java.sun.com/dtd/preferences.dtd">
<preferences EXTERNAL_XML_VERSION="1.0">
  <root type="user">
    <map/>
    <node name="airsquared">
      <map/>
      <node name="blobsaver">
        <map/>
        <node name="app">
          <map/>
          <node name="Saved Devices">
            <map/>
EOF

for device in $(bashio::config 'devices|keys'); do
    name=$(bashio::config "devices[${device}].name")
    device_id=$(bashio::config "devices[${device}].device_id")
    ecid=$(bashio::config "devices[${device}].ecid")
    generator=$(bashio::config "devices[${device}].generator")
    apnonce=$(bashio::config "devices[${device}].apnonce")
    enabled=$(bashio::config "devices[${device}].enabled") 


    cat >>blobs.xml <<EOF
                <node name="$name">
                  <map>
                    <entry key="Generator" value="$generator"/>
                    <entry key="Save Path" value="$save_path"/>
                    <entry key="Apnonce" value="$apnonce"/>
                    <entry key="Save in background" value="$enabled"/>
                    <entry key="Device Identifier" value="$device_id"/>
                    <entry key="ECID" value="$ecid"/>
                    <entry key="Include Betas" value="$include_betas"/>
                  </map>
                </node>
EOF
done

cat >>blobs.xml <<EOF
         </node>
        </node>
      </node>
    </node>
  </root>
</preferences>
EOF

cp blobs.xml /share/blobs
bashio::log.info "Configuration created in current dir (you find a copy in '/share/blobs/blobs.xml')"

export BLOBSAVER_CLI_ONLY=1

bashio::log.info "$(cat blobs.xml)"

bashio::log.info "Import configuration..."

./bin/blobsaver --import blobs.xml

for device in $(bashio::config 'devices|keys'); do
    ./bin/blobsaver --enable-background $(bashio::config "devices[${device}].name")
done

bashio::log.info "Starting blobsaver service..."
while true; do ./bin/blobsaver --background-autosave; sleep 86400; done
