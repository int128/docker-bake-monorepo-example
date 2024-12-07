group "default" {
  targets = [
    "service1",
    "service2",
  ]
}

target "docker-metadata-action" {
  output = ["type=registry"]
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
