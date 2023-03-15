variable "name_prefix" {
  type        = string
  description = "Prefix to use for naming the security group"
}
variable "vpc_id" {
  type        = string
  description = "id of the vpc"
}
variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of ingress rules to apply to the security group"
}
variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "List of egress rules to apply to the security group"
}