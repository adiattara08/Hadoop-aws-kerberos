variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type       = string
  default     = "ami-0fc5d935ebf8bc3bc" # Ubuntu 20.04 LTS // us-east-1
}

variable "type" {
  description = "ec2 instance type"
  type        = string
  default     = "m5.large"
}

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "us-east-1"
}

variable "instance_name" {
  description = "name of ec2 instance"
  type        = string
  default     = "hadoop"
}
variable "key_name" {
  description = "name of key pair"
  type        = string
  default     = "hadoop"
}