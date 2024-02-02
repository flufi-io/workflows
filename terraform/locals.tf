locals {
  password = concat("", random_password.password.result, var.secret)
}
