variable "cidr_block" {
  type        = string
  description = "this is represent VPC CIDR Block"
}
variable  "subnet_public_1" {
    type        = string
    description = "this is represent public subnet1 CIDR block"
}
variable  "subnet_public_2" {
    type        = string
    description = "this is represent public subnet2 CIDR block"
}
variable  "subnet_private_1" {
    type        = string
    description = "this is represent private1 subnet1 CIDR block"
}
variable  "subnet_private_2" {
    type        = string
    description = "this is represent private2 subnet1 CIDR block"
}
variable  "availability_zone1" {
    type        = string
    description = "this is represent Az1"
}
variable  "availability_zone2" {
    type        = string
    description = "this is represent Az2"
}
