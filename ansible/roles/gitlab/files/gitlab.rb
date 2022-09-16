external_url 'https://git.theorangeone.net'
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

gitlab_rails['time_zone'] = '{{ timezone }}'

# https://docs.gitlab.com/omnibus/settings/memory_constrained_envs.html
puma['worker_processes'] = 2
sidekiq['max_concurrency'] = 10

gitlab_rails['gitlab_default_theme'] = 2

nginx['real_ip_header'] = 'X-Forwarded-For'
nginx['real_ip_trusted_addresses'] = ['{{ pve_hosts.docker.ip }}/32']
gitlab_rails['trusted_proxies'] = ['{{ pve_hosts.docker.ip }}/32']

# SMTP
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.eu.mailgun.org"
gitlab_rails['smtp_port'] = 465
gitlab_rails['smtp_user_name'] = "{{ gitlab_smtp_user }}"
gitlab_rails['smtp_password'] = "{{ gitlab_smtp_password }}"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = true
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'
gitlab_rails['gitlab_email_from'] = "{{ gitlab_from_email }}"

gitlab_rails['artifacts_path'] = "/mnt/gitlab-bulk/artifacts"
gitlab_rails['backup_path'] = "/mnt/gitlab-bulk/backups"

# Registry
registry_external_url "https://registry.git.theorangeone.net"
registry_nginx['redirect_http_to_https'] = false
registry_nginx['ssl_certificate'] = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
registry_nginx['ssl_certificate_key'] = "/etc/ssl/private/ssl-cert-snakeoil.key"
registry['storage'] = {
  's3' => {
    'accesskey' => '{{ gitlab_registry_access_key }}',
    'secretkey' => '{{ gitlab_registry_secret_key }}',
    'bucket' => '0rng-registry',
    'region' => 'eu-central-003',
    'regionendpoint' => 'https://s3.eu-central-003.backblazeb2.com'
  }
}

# https://gitlab.com/gitlab-org/omnibus-gitlab/-/issues/6895
nginx['worker_processes'] = "auto"
