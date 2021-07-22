output "public_ip" {
	value = [ for x in docker_container.grafana_container: "${x.name} - ${x.ip_address}" ]
}
