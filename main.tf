# Define an Azure Resource Group
resource "azurerm_resource_group" "learningt3rraf0rm" {
  name     = var.resource_group_name
  location = var.location
}

# Define a Virtual Network (VNet)
resource "azurerm_virtual_network" "T3rraNet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.learningt3rraf0rm.location
  resource_group_name = azurerm_resource_group.learningt3rraf0rm.name
}

# Define a subnet within the VNet
resource "azurerm_subnet" "SubT3rra" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.learningt3rraf0rm.name
  virtual_network_name = azurerm_virtual_network.T3rraNet.name
  address_prefixes     = var.subnet_prefix
}

# Define a Network Interface
resource "azurerm_network_interface" "T3rra-nic" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.learningt3rraf0rm.location
  resource_group_name = azurerm_resource_group.learningt3rraf0rm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SubT3rra.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Define the Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "virtual-machine" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.learningt3rraf0rm.name
  location            = azurerm_resource_group.learningt3rraf0rm.location
  size                = var.vm_size

  admin_username      = var.admin_username
  admin_password      = var.admin_password

# Disable SSH key authentication and enable password authentication
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.T3rra-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = var.tags
}

