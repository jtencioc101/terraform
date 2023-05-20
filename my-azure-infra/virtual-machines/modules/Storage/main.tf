# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.linux-vm-rg.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "storage" {
  name                     = "storage${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.linux-vm-rg.name
  location                 = azurerm_resource_group.linux-vm-rg.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  tags                     = var.tags
}