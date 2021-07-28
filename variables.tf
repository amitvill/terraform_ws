variable "image" {
  type        = map(any)
  description = "Image for container"
  default = {
    nodered = {
      dev  = "nodered/node-red:latest"
      prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
      dev  = "quay.io/influxdb/influxdb:v2.0.2"
      prod = "quay.io/influxdb/influxdb:v2.0.2"
    }
    grafana = {
      dev  = "grafana/grafana:latest"
      prod = "grafana/grafana:v6.5"
    }
  }

}



variable "external_port" {
  type = map(any)

  # validation {
  #     condition = max(var.external_port["dev"]...) <= 65535 && min(var.external_port["dev"]...) >= 1980
  #     error_message = "The external port must be larger than 0 and less than 65536."
  # }

  # validation {
  #     condition = max(var.external_port["prod"]...) < 1980 && min(var.external_port["prod"]...) >= 1880
  #     error_message = "The external port must be larger than 0 and less than 65536."
  # }
}

variable "internal_port" {
  type = map(any)
  default = {
    nodered = {
      value = 1880
      # validation {
      #     condition = var.internal_port == 1800
      #     error_message = "NodeRed internal port must be 1880."
      # }
    }
    influxdb = {
      value = 8086
      # validation {
      #     condition = var.internal_port == 8086
      #     error_message = "InfluxDB internal port must be 8086."
      # }

    }
    grafana = {
      value = 3000
      # validation {
      #     condition = var.internal_port == 3000
      #     error_message = "grafana internal port must be 3000."
      # }

    }
  }


}