variable "allocated_storage" {
  description = "this is represent a storage of RDS DB"
}
variable "db_name" {
  description = "Here we're represent our DB name"
}
variable "engine" {
  description = "On this description we're represent our DB enging"
}
variable "engine_version" {
  description = "Here we spcified DB enging version"  
}
variable "instance_class" {
  description = "this is a instance type of our DB"
}
variable "username" {
  description = "this  is represent our user name inside DB"
}
variable "password" {
  description = "On this description we're specified our user password inside DB "
}
variable "db_subnet_group_name" {
  description = "represent subnet id of our VPC"
}
variable "vpc_security_group_ids" {
  description = "security group ID"
}
variable "skip_final_snapshot" {
  type        = bool
  description = "we are just skip our db snapshot"
}