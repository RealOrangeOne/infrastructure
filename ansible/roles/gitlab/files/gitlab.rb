external_url 'https://git.theorangeone.net'
nginx['redirect_http_to_https'] = false
nginx['listen_https'] = false
nginx['listen_port'] = 80
grafana['enable'] = false
nginx['status'] = {
    'enable' => false
}
letsencrypt['enable'] = false
puma['worker_processes'] = 4
gitlab_rails['time_zone'] = 'Europe/London'

alertmanager['enable'] = false
prometheus_monitoring['enable'] = false

postgresql['enable'] = false
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'unicode'
gitlab_rails['db_host'] = 'db'
gitlab_rails['db_password'] = 'gitlab'

redis['enable'] = false
gitlab_rails['redis_host'] = 'redis'
gitlab_rails['redis_port'] = 6379

gitlab_rails['gitlab_default_theme'] = 2

nginx['real_ip_trusted_addresses'] = ['172.80.0.0/16']
gitlab_rails['trusted_proxies'] = ['172.80.0.0/16']
nginx['real_ip_header'] = 'X-Forwarded-For'

gitlab_pages['enable'] = false
pages_external_url "https://pages.theorangeone.net"
pages_nginx['enable'] = false
gitlab_rails['pages_path'] = "/mnt/pages"
gitlab_pages['external_http'] = ['0.0.0.0:8808']
