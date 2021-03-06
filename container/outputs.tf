output "app_access" {
  value       = { for x in docker_container.app_container[*] : x.name => join(":", [x.ip_address], x.ports[*]["external"]) }
  description = "The names and sockets for each application."

}
