## BACKEND

variable backend_resource_group_name{
  type        = string
  description = "Name of the existing resource group state is going to be saved into"
  default     = "rg1"
}

variable backend_storage_account_name{
  type        = string
  description = "Name of the existing storage account state is going to be saved into"
  default     = "sg1"
}

variable backend_container_name{
  type        = string
  description = "Name of the container state is going to be saved into"
  default     = "tfstate"
}

variable backend_core_key{
  type        = string
  description = "Name of the file state is going to be saved into"
  default     = "core.tfstate"
}


# RESOURCES

variable subnet_name{
  type        = string
  description = "Name of core vnet"
  default     = "lzsubnet"
}

variable subnet_address_space{
  type        = list(string)
  description = "Adress space of core"
  default     = ["10.70.1.0/24"]
}