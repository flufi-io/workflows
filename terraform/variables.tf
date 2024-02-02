variable "length" {
  description = "Length of the password"
  type =        number
}
variable "special" {
  description = "Include special characters"
  type =        bool
}
variable "secret" {
  description = "The secret to be generated"
  type =        string
  sensitive =   true
}
