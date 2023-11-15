# Define an Azure Resource Group
resource "azurerm_resource_group" "learningt3rraf0rm" {
  name     = "var.resource_group_name" # Change to your desired resource group name
  location = "var.location"       # Change to your desired Azure region
}

# Define a Virtual Network (VNet)
resource "azurerm_virtual_network" "T3rraNet" {
  name                = "var.vnet_name"
  address_space       = "var.vnet_address_space" # Change to your desired address space
  location            = azurerm_resource_group.T3rraNet.location
  resource_group_name = azurerm_resource_group.T3rraNet.name
}

# Define a subnet within the VNet
resource "azurerm_subnet" "SubT3rra" {
  name                 = "var.subnet_name"
  resource_group_name  = azurerm_resource_group.SubT3rra.name
  virtual_network_name = azurerm_virtual_network.SubT3rra.name
  address_prefixes     = "var.subnet_prefix" # Change to your desired subnet prefix
}

# Define a Network Interface
resource "azurerm_network_interface" "T3rra-nic" {
  name                = "var.network_interface_name"
  location            = azurerm_resource_group.T3rra-nic.location
  resource_group_name = azurerm_resource_group.T3rra-nic.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Define the Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "virtual-machine" {
  name                = "var.vm_name" # Change to your desired VM name
  resource_group_name = azurerm_resource_group.virtual-machine.name
  location            = azurerm_resource_group.virtual-machine.location
  size                = "var.vm_size" # Change to your desired VM size

  admin_username      = "var.admin_username" # Change to your desired admin username
  admin_password      = "var.admin_password" # Set a strong password

  network_interface_ids = [azurerm_network_interface.T3rra-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "var.image_publisher" # Change to the image publisher
    offer     = "var.image_offer"  # Change to the image offer
    sku       = "var.image_sku"  # Change to the image SKU
    version   = "var.image_version"  # Change to the desired version
  }

  tags = {
    Name = "var.tags" # Change tags as needed
  }
}
