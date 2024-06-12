terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image" {
	name = "nginx:latest"
	keep_locally = false
}

resource "docker_container" "nginx_container" {
	name = "my_container"
	image = docker_image.nginx_image.image_id
	ports {
		internal = 80
		external = 80
}
}
