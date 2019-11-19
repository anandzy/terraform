variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mac"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mac.pub"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-6871a115"
    #us-west-2 = "ami-06b94666"
    #us-east-1 = "ami-844e0bf7"
  }
}
