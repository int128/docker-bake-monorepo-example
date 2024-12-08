group "default" {
  targets = [
    "service1",
    "service2",
  ]
}

target "docker-metadata-action" {}

target "service1" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service1.dockerfile"
  tags = [for tag in target.docker-metadata-action.tags : replace(tag, "__service__", "service1")]
}

target "service2" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service2.dockerfile"
  tags = [for tag in target.docker-metadata-action.tags : replace(tag, "__service__", "service2")]
}
