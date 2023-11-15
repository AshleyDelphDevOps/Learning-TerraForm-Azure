variable "ARM_SUBSCRIPTION_ID" {
  description = "The Subscription ID used for Azure resources"
  type        = string
}

variable "ARM_CLIENT_ID" {
  description = "The Client ID used for Azure resources"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "The Client Secret ID"
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "learningt3rraf0rm"
}

variable "location" {
  description = "The Azure region for the resource group"
  type        = string
  default     = "UK South"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "T3rraNet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "SubT3rra"
}

variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "network_interface_name" {
  description = "The name of the network interface"
  type        = string
  default     = "T3rra-nic"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "Terraform Testing"
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = "admint3rra"
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  default     = "T3rraTesting123@"
}

variable "image_publisher" {
  description = "The publisher of the VM image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "The offer of the VM image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "The SKU of the VM image"
  type        = string
  default     = "18_04-lts-gen2"
}

variable "image_version" {
  description = "The version of the VM image"
  type        = string
  default     = "18.04.202205060"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    Name = "Terraform Testing"
  }
}
