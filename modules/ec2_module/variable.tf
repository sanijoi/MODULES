variable  "ami_id" {
    type        = string
    description = "this is represent ami id"
}
variable "instance_type" {
  type          = string
  description   = "this is represent instance type"
}
variable "vpc_security_group_ids" {
  type          = list (string)
  description   = "this is represent security of VPS id "
}
variable "subnet_id" {
  type          = string
  description   = "This is represent subnet id" 
}
variable "key_name" {
  type          = string
  description   = "This's reperesent key name"
}
variable "tags" {
  description = "This is tags description"
}
variable "associate_public_ip_address" {
  description = "this i'm specified public ip addres"
}