#!/usr/bin/env bashio

work_dir=$(bashio::config "work_dir")

bashio::log.info "Starting python scheduler..."
/usr/bin/python3 ./scheduler.py 