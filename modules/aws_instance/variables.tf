variable "instances" {}

variable "ami_id" {
  type = string
  default = "ami-02396cdd13e9a1257"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet" {}

# We're going to be passing that value for our instances and for subnet through root module