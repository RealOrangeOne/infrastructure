#!/usr/bin/env bash

set -ex

cd /opt/mastodon

docker-compose exec mastodon tootctl accounts prune
docker-compose exec mastodon tootctl media remove --days=7
docker-compose exec mastodon tootctl statuses remove --days=7
docker-compose exec mastodon tootctl preview_cards remove --days=7
docker-compose exec mastodon tootctl media remove-orphans
docker-compose exec mastodon tootctl cache clear
