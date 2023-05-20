variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
}


variable "ansible_pk" {
  type        = string
  description = "Private key for Ansible"
}

variable "ansible_python" {
  type        = string
  description = "Python interpreter for Ansible"
}