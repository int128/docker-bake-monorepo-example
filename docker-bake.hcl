group "default" {
  targets = [
    "service1",
    "service2",
  ]
}

variable "DOCKER_METADATA_OUTPUT_TAGS" {}

target "docker-metadata-action" {}

target "service1" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service1.dockerfile"
  tags = ["${replace(DOCKER_METADATA_OUTPUT_TAGS, "__service__", "service1")}"]
}

target "service2" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service2.dockerfile"
  tags = ["${replace(DOCKER_METADATA_OUTPUT_TAGS, "__service__", "service2")}"]
}
