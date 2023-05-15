# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.jumpbox-rg.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "storage" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.jumpbox-rg.name
  location                 = azurerm_resource_group.jumpbox-rg.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  tags                     = var.tags
}

resource "azurerm_linux_virtual_machine" "jumpbox" {
  name                  = var.vm_name
  location              = azurerm_resource_group.jumpbox-rg.location
  resource_group_name   = azurerm_resource_group.jumpbox-rg.name
  network_interface_ids = [azurerm_network_interface.jumpbox-nic.id]
  size                  = var.vm_size

  os_disk {
    name                 = var.os_disk_name
    caching              = var.os_disk_caching
    storage_account_type = var.os_storage_account_type
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.os_version
  }

  computer_name                   = var.computer_name
  admin_username                  = var.admin_username
  disable_password_authentication = var.disable_password_auth

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")

  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage.primary_blob_endpoint
  }

  tags = var.tags
}