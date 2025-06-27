#!/usr/bin/env bash

# Based on https://ricard.dev/improving-mastodons-disk-usage/

set -ex

cd /opt/mastodon

docker-compose exec mastodon tootctl accounts prune
docker-compose exec mastodon tootctl media remove
docker-compose exec mastodon tootctl media remove --prune-profiles
docker-compose exec mastodon tootctl preview_cards remove --days=21
docker-compose exec mastodon tootctl media remove-orphans
docker-compose exec mastodon tootctl statuses remove --days=180
