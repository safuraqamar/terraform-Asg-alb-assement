variable "cidr" {
    default = [] # "10.1.0.0/16"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "name" {
    default = []
}
variable "pub_subnet_1" {
    default =[]
}
variable "pub_subnet_2" {
    default =[]
}