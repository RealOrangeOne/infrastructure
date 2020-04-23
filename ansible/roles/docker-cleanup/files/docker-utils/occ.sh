#!/usr/bin/env bash

set -e

docker-compose -f /opt/nextcloud/docker-compose.yml exec -u abc nextcloud php /config/www/nextcloud/occ $@
