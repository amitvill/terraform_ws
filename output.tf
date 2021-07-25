output "IP-Address" {
    value = flatten(module.container[*].ip-address)
    description = "The IP address of the container"
    
}

output "Container-Name" {
    value = module.container[*].container-name
    description = "The name of the container"
}