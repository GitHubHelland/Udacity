variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "webserver"
}

variable "environment"{
  description = "The environment should be used for all resources in this example"
  default = "project1"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "UK South" 
}

variable "username"{
  default = "username"
}

variable "password"{
  default= "password"
}

variable "packerImageId"{
  default = "/subscriptions/db48a711-1f20-4b46-9eaa-0e35ac94dc66/resourceGroups/webserver-rg/providers/Microsoft.Compute/images/myPackerImage"
}

variable "vm_count"{
  default = "2"
}
