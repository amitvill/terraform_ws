terraform {
	required_providers {
		docker = {
			source = "kreuzwerker/docker"
		}
	}	
}

provider docker {}

resource "docker_image" "container_image" {
	name = var.image 
}

resource "docker_container" "grafana_container" {
	count = var.count_container 
	name = "grafana-${count.index}"
	image= docker_image.container_image.latest
	ports {
		external = ext_port[count.index]
	} 
}
