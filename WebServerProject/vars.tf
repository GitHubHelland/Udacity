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
  default = myPackerImage"
}

variable "vm_count"{
  default = "2"
}
