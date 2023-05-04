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
  default     = "<SUBNET ID>"
}

# Run "az group list -otable" to get resource group name and resource group location
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "<RESOURCE GROUP NAME>"
}


variable "resource_group_location" {
  description = "Resource group Location"
  type        = string
  default     = "<RESOURCE GROUP LOCATION>"
}
