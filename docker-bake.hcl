group "default" {
  targets = [
    "service1",
    "service2",
  ]
}

target "docker-metadata-action" {}

target "docker-build-cache-config-action" {}

target "service" {
  name = service
  matrix = {
    service = [
      "service1",
      "service2",
    ]
  }

  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "${service}.dockerfile"
  tags = [for tag in target.docker-metadata-action.tags : replace(tag, "__service__", service)]
  cache-from = [for cache-from in target.docker-build-cache-config-action.cache-from : replace(cache-from, "__service__", service)]
  cache-to = [for cache-to in target.docker-build-cache-config-action.cache-to : replace(cache-to, "__service__", service)]
}
