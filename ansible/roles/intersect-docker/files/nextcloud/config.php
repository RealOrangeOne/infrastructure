<?php
$CONFIG = array (
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'filelocking.enabled' => true,
  'redis' =>
  array (
    'host' => 'redis',
    'port' => 6379,
    'timeout' => 0.0,
  ),
  'datadirectory' => '/data',
  'instanceid' => '{{ nextcloud.instance_id }}',
  'passwordsalt' => '{{ nextcloud.passwordsalt }}',
  'secret' => '{{ nextcloud.secret }}',
  'trusted_domains' =>
  array (
    0 => 'intersect.jakehoward.tech',
  ),
  'dbtype' => 'pgsql',
  'version' => '19.0.1.1',
  'overwrite.cli.url' => 'https://intersect.jakehoward.tech',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '5432',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'nextcloud',
  'installed' => true,
  'trusted_proxies' =>
  array (
    0 => '172.17.0.1',
  ),
  'maintenance' => false,
  'theme' => '',
  'loglevel' => 2,
);
