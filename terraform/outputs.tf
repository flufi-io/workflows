output "random_password" {
  value       = local.password
  description = "this is a dummy password"
  sensitive   = true
}
