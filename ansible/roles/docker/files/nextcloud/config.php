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
    1 => '192.168.1.200',
    2 => 'onlyoffice.jakehoward.tech',
  ),
  'dbtype' => 'mysql',
  'version' => '18.0.1.3',
  'overwrite.cli.url' => 'https://intersect.jakehoward.tech',
  'dbname' => 'nextcloud',
  'dbhost' => 'mariadb:3306',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'nextcloud',
  'installed' => true,
  'trusted_proxies' =>
  array (
    0 => '10.23.0.1/24',
    1 => '172.0.0.1/8',
    2 => '192.168.0.0/16',
  ),
  'maintenance' => false,
  'twofactor_enforced' => 'false',
  'twofactor_enforced_groups' =>
  array (
  ),
  'twofactor_enforced_excluded_groups' =>
  array (
  ),
  'theme' => '',
  'loglevel' => 2,
);
