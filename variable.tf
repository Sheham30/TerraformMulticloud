variable "enable_aws" {
  description = "Enable / Disable AWS deployment"
  type        = bool
  #   default = true
}

variable "enable_azure" {
  description = "Enable / Disable Azure deployment"
  type        = bool
  #   default = true
}

variable "instance_count" {
  description = "Number of Instances"
  type        = string
  #   default = 1
}

variable "aws_subnet" {
  description = "AWS Subnet"
  type        = string
  default     = "subnet-0414fde98fd6fd39b"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "1-7e675ab3-playground-sandbox"
}


variable "resource_group_location" {
  description = "Resource group Location"
  type        = string
  default     = "westus"
}
