<?php
  // *******************************************
  // *** Database configuration (important!) ***
  // *******************************************

  define('DB_TYPE', 'pgsql');
  define('DB_HOST', 'db');
  define('DB_USER', 'tt-rss');
  define('DB_NAME', 'tt-rss');
  define('DB_PASS', 'tt-rss');
  define('DB_PORT', '5432');
  define('MYSQL_CHARSET', 'UTF8');

  // ***********************************
  // *** Basic settings (important!) ***
  // ***********************************

  define('SELF_URL_PATH', 'https://tt-rss.jakehoward.tech/');
  define('SINGLE_USER_MODE', false);
  define('SIMPLE_UPDATE_MODE', false);

  // *****************************
  // *** Files and directories ***
  // *****************************

  define('PHP_EXECUTABLE', '/usr/bin/php');
  define('LOCK_DIRECTORY', 'lock');
  define('CACHE_DIR', 'cache');
  define('ICONS_DIR', "feed-icons");
  define('ICONS_URL', "feed-icons");

  // **********************
  // *** Authentication ***
  // **********************

  define('AUTH_AUTO_CREATE', true);
  define('AUTH_AUTO_LOGIN', true);

  // *********************
  // *** Feed settings ***
  // *********************

  define('FORCE_ARTICLE_PURGE', 0);

  // ****************************
  // *** Sphinx search plugin ***
  // ****************************

  define('SPHINX_SERVER', 'localhost:9312');
  define('SPHINX_INDEX', 'ttrss, delta');

  // ***********************************
  // *** Self-registrations by users ***
  // ***********************************

  define('ENABLE_REGISTRATION', false);
  define('REG_NOTIFY_ADDRESS', 'user@your.domain.dom');
  define('REG_MAX_USERS', 10);

  // **********************************
  // *** Cookies and login sessions ***
  // **********************************

  define('SESSION_COOKIE_LIFETIME', 864000);

  // *********************************
  // *** Email and digest settings ***
  // *********************************

  define('SMTP_FROM_NAME', 'Tiny Tiny RSS');
  define('SMTP_FROM_ADDRESS', 'noreply@your.domain.dom');
  define('DIGEST_SUBJECT', '[tt-rss] New headlines for last 24 hours');

  // ************************
  // *** General settings ***
  // ************************

  define('CHECK_FOR_UPDATES', false);
  define('ENABLE_GZIP_OUTPUT', true);
  define('PLUGINS', 'auth_internal, note');
  define('LOG_DESTINATION', 'sql');
  define('CONFIG_VERSION', 26);
