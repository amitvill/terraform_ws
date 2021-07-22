
module "image" {
	source = "./image"
}

resource "random_string" "random" {
  count = local.container_count
  length = 4
  special = false
  upper = false
}

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-",["nodered", terraform.workspace, random_string.random[count.index].result])
  image = module.image.image_out
  ports {
    internal = var.internal_port
    external = var.external_port[terraform.workspace][count.index]
  }
}