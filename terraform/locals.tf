locals {
  password = join("", random_password.password.result, var.secret)
}
