# variable "env" {
#     type = string
#     default = "dev"
#     description = "Env to deploy to"
# }

variable "image" {
    type = map
    description = "Image for container"
    default = {
        dev = "nodered/node-red:latest"
        prod = "nodered/node-red:latest-minimal"
    }
}



variable "external_port" {
    type = map
    
    validation {
        condition = max(var.external_port["dev"]...) <= 65535 && min(var.external_port["dev"]...) >= 1980
        error_message = "The external port must be larger than 0 and less than 65536."
    }
    
    validation {
        condition = max(var.external_port["prod"]...) < 1980 && min(var.external_port["prod"]...) >= 1880
        error_message = "The external port must be larger than 0 and less than 65536."
    }
}

variable "internal_port" {
    type = number
    default = 1800
    
    validation {
        condition = var.internal_port == 1800
        error_message = "The internal port must be 1880."
    }
}

variable "container_count" {
    type = number
    default = 3
}

locals {
    container_count = length(lookup(var.external_port, terraform.workspace))
}