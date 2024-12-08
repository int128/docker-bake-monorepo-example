variable "GITHUB_REPOSITORY" {}

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
  tags = ["ghcr.io/${GITHUB_REPOSITORY}/service1:${target.docker-metadata-action.tags}"]
}

target "service2" {
  inherits = ["docker-metadata-action"]
  context = "."
  dockerfile = "service2.dockerfile"
  tags = ["ghcr.io/${GITHUB_REPOSITORY}/service2:${target.docker-metadata-action.tags}"]
}
