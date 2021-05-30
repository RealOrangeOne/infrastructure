external_url 'https://code.theorangeone.net'
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
sidekiq['max_concurrency'] = 10


gitlab_rails['gitlab_default_theme'] = 2

nginx['real_ip_header'] = 'X-Forwarded-For'
nginx['real_ip_trusted_addresses'] = ['{{ pve_hosts.pve_docker.ip }}/32']
gitlab_rails['trusted_proxies'] = ['{{ pve_hosts.pve_docker.ip }}/32']

# SMTP
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.fastmail.com"
gitlab_rails['smtp_port'] = 465
gitlab_rails['smtp_user_name'] = "{{ gitlab_smtp_user }}"
gitlab_rails['smtp_password'] = "{{ gitlab_smtp_password }}"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = true
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'
gitlab_rails['gitlab_email_from'] = "{{ gitlab_smtp_user }}"
