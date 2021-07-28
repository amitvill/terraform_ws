

module "image" {
  source   = "./image"
  for_each = local.deployments
  image_in = each.value.image
}



module "container" {
  source   = "./container"
  count_in = each.value.container_count
  for_each = local.deployments

  name_in  = each.key
  image_in = module.image[each.key].image_out

  int_port_in = each.value.in_port
  ext_port_in = each.value.ext_port

  volumes_in = each.value.volumes

}