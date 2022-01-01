module.exports = {
  endpoint: 'https://git.theorangeone.net/api/v4/',
  token: '{{ renovate_gitlab_token }}',
  platform: 'gitlab',
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
