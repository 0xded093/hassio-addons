#!/usr/bin/env bashio

bashio::log.info "Starting gitea..."

gitea_work_dir=$(bashio::config "gitea_work_dir")

su -s /bin/sh gitea  <<EOF
GITEA_WORK_DIR=$gitea_work_dir gitea web
EOF


