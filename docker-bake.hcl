target "docker-metadata-action" {
}

target "service1" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service1.dockerfile"
}

target "service2" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service2.dockerfile"
}
