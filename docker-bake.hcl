group "default" {
  targets = [
    "service1",
    "service2",
  ]
}

target "docker-metadata-action" {}

target "docker-build-cache-config-action" {}

target "service1" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service1.dockerfile"
  tags = [for tag in target.docker-metadata-action.tags : replace(tag, "__service__", "service1")]
  cache-from = [for cache-from in target.docker-build-cache-config-action.cache-from : replace(cache-from, "__service__", "service1")]
  cache-to = [for cache-to in target.docker-build-cache-config-action.cache-to : replace(cache-to, "__service__", "service1")]
}

target "service2" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service2.dockerfile"
  tags = [for tag in target.docker-metadata-action.tags : replace(tag, "__service__", "service2")]
  cache-from = [for cache-from in target.docker-build-cache-config-action.cache-from : replace(cache-from, "__service__", "service2")]
  cache-to = [for cache-to in target.docker-build-cache-config-action.cache-to : replace(cache-to, "__service__", "service2")]
}
