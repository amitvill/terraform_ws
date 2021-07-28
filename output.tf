output "app_access" {
  value       = [for x in module.container[*] : x]
  description = "The IP address of the container"

}