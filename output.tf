# Output the IP Address of the Virtual Machine
output "public_ip_address" {
  value = azurerm_linux_virtual_machine.web.public_ip_address
}
