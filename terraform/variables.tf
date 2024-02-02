variable "length" {
  description = "Length of the password"
  type =        number
}
variable "special" {
  description = "Include special characters"
  type =        bool
}
variable "override_special" {
  type =        string
  description = "Override special characters"
}

variable "secret" {
  description = "The secret to be generated"
  type =        string
  sensitive =   true
}
