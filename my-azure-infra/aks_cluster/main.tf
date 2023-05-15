resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create Jumpbox components
resource "azurerm_resource_group" "jumpbox-rg" {
  name     = var.jumpbox_resource_group
  location = var.jumpbox_location
}