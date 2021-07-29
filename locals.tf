
locals {
  deployments = {
    nodered = {
      container_count = length(var.external_port["nodered"][terraform.workspace])
      image           = var.image["nodered"][terraform.workspace]
      in_port         = var.internal_port["nodered"].value
      ext_port        = var.external_port["nodered"][terraform.workspace]
      volumes = [
        { container_path_each = "/data" }
      ]
    }
    influxdb = {
      image           = var.image["influxdb"][terraform.workspace]
      container_count = length(var.external_port["influxdb"][terraform.workspace])
      image           = var.image["influxdb"][terraform.workspace]
      in_port         = var.internal_port["influxdb"].value
      ext_port        = var.external_port["influxdb"][terraform.workspace]
      volumes = [
        { container_path_each = "/var/lib/influxdb" }
      ]
    }
    grafana = {
      image           = var.image["grafana"][terraform.workspace]
      container_count = length(var.external_port["grafana"][terraform.workspace])
      image           = var.image["grafana"][terraform.workspace]
      in_port         = var.internal_port["grafana"].value
      ext_port        = var.external_port["grafana"][terraform.workspace]
      volumes = [
        { container_path_each = "/etc/grafana" },
        { container_path_each = "/var/lib/grafana" }
      ]
    }
  }
}