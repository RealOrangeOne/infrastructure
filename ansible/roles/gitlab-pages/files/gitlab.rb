external_url 'https://git.theorangeone.net'

grafana['enable'] = false
postgresql['enable'] = false
redis['enable'] = false
prometheus['enable'] = false
puma['enable'] = false
sidekiq['enable'] = false
gitlab_workhorse['enable'] = false
gitaly['enable'] = false
alertmanager['enable'] = false
node_exporter['enable'] = false
gitlab_rails['auto_migrate'] = false
nginx['enabled'] = false

pages_external_url "https://pages.theorangeone.net"
pages_nginx['enable'] = false
gitlab_pages['external_http'] = ['0.0.0.0:8080']
gitlab_pages['inplace_chroot'] = true
