## Resources
variable resource_group_name{
  type        = string
  description = "Name of the core resource group"
  default     = "examplecore"
}

variable location{
  type        = string
  description = "Location for the resources"
  default     = "westeurope"
}

variable vnet_name{
  type        = string
  description = "Name of core vnet"
  default     = "corevnet"
}

variable vnet_address_space{
  type        = list(string)
  description = "Adress space of core"
  default     = ["10.70.0.0/16"]
}