module.exports = {
  endpoint: 'https://git.theorangeone.net/',
  token: '{{ renovate_gitea_token }}',
  platform: 'gitea',
  //dryRun: true,
  autodiscover: true,
  onboarding: false,
  redisUrl: 'redis://redis',
  repositoryCache: 'enabled',
  persistRepoData: true,
  binarySource: "docker",
  dockerUser: "{{ docker_user.id }}",
  baseDir: "/opt/renovate/renovate",
  cacheDir: "/opt/renovate/renovate/cache"
};
