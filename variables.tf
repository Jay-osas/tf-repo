#Variable definition for the resource group
variable "res_grp_name" {
  type = string
  description = "resource group name"
  default = "Demo.RG"
}

variable "res_grp_location" {
  type = string
  description = "resource group region"
  default = "East US"
}

variable "sub_id" {
    type = string
    description = "subscription id"
    default     = ""

}

variable "vnet_name" {
    type = string
    description = "vnet name"
    default = "Demo.Vnet"
}

variable "address_space" {
  type = list(string)
  description = "Address space of the vnet"
  default = ["10.200.28.0/22"]
}

variable "subnet_name"{
    type = list(string)
    description = "Name of subnet"
    default = ["Demo.Web", "Demo.App", "Demo.DB", "Demo.Misc"]

}

#variable definition for the subnet

variable "address_prefix" {
  description = "List of address space of the subnet"
  type = list(string)
  default = ["10.200.28.0/24", "10.200.29.0/24", "10.200.30.0/24", "10.200.31.0/24"]   
    
}

