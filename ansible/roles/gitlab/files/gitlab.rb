external_url 'https://{{ pve_hosts.gitlab.ip }}'  # Obviously temporary
nginx['redirect_http_to_https'] = false
alertmanager['enable'] = false
prometheus_monitoring['enable'] = false
grafana['enable'] = false
nginx['status'] = {
    'enable' => false
}

nginx['ssl_certificate'] = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
nginx['ssl_certificate_key'] = "/etc/ssl/private/ssl-cert-snakeoil.key"
letsencrypt['enable'] = false

gitlab_rails['time_zone'] = '{{ TZ }}'

# https://docs.gitlab.com/omnibus/settings/memory_constrained_envs.html
puma['worker_processes'] = 2
sidekiq['max_concurrency'] = 5
gitaly['ruby_max_rss'] = 200_000_000
gitaly['cgroups_count'] = 2
gitaly['cgroups_mountpoint'] = '/sys/fs/cgroup'
gitaly['cgroups_hierarchy_root'] = 'gitaly'
gitaly['cgroups_memory_enabled'] = true
gitaly['cgroups_memory_limit'] = 250000
gitaly['cgroups_cpu_enabled'] = true
gitaly['cgroups_cpu_shares'] = 512
gitaly['env'] = {
  'GITALY_COMMAND_SPAWN_MAX_PARALLEL' => '2'
}


gitlab_rails['gitlab_default_theme'] = 2

nginx['real_ip_header'] = 'X-Forwarded-For'
#nginx['real_ip_trusted_addresses'] = ['172.80.0.0/16']
#gitlab_rails['trusted_proxies'] = ['172.80.0.0/16']
