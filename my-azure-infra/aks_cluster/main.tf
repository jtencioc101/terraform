resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "aks-vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "aks-default-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.aks-vnet.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name
  node_resource_group = var.node_resource_group


  default_node_pool {
    name                = var.system_node_name
    node_count          = var.system_node_count
    vm_size             = var.system_node_vm_size
    type                = var.system_node_type
    enable_auto_scaling = var.enable_auto_scaling
    tags                = var.tags
    vnet_subnet_id      = azurerm_subnet.aks-default-subnet.id
  }
  identity {
    type = var.identity_type
  }

  network_profile {
    network_plugin = var.network_plugin
  }
  private_cluster_enabled = var.private_cluster_enabled

}


resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = var.user_node_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.user_node_size
  node_count            = var.user_node_count
  os_disk_type          = var.user_os_disk_type
  enable_auto_scaling   = var.user_node_auto_scale
  min_count             = var.user_node_min_count
  max_count             = var.user_node_max_count
  tags                  = var.tags
  vnet_subnet_id        = azurerm_subnet.aks-default-subnet.id
}

#todo --- add block to create Jumpbox VM
resource "azurerm_resource_group" "jumpbox-rg" {
  name     = var.jumpbox_resource_group
  location = var.jumpbox_location
}
resource "azurerm_virtual_network" "jumpbox" {
  name                = var.jumpbox_vnet_name
  address_space       = var.jumpbox_address_space
  location            = azurerm_resource_group.jumpbox-rg.location
  resource_group_name = azurerm_resource_group.jumpbox-rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.jumpbox-rg.name
  virtual_network_name = azurerm_virtual_network.jumpbox.name
  address_prefixes     = var.jumpbox_address_prefixes
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.jumpbox-rg.location
  resource_group_name = azurerm_resource_group.jumpbox-rg.name
  allocation_method   = var.ip_allocation_method
  tags                = var.tags
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.jumpbox-rg.location
  resource_group_name = azurerm_resource_group.jumpbox-rg.name

  security_rule {
    name                       = var.nsg_rule_name
    priority                   = var.nsg_rule_priority
    direction                  = var.nsg_rule_direction
    access                     = var.nsg_rule_access
    protocol                   = var.nsg_rule_protocol
    source_port_range          = var.nsg_rule_source_port_range
    destination_port_range     = var.nsg_rule_destination_port_range
    source_address_prefix      = var.nsg_rule_source_address_prefix
    destination_address_prefix = var.nsg_rule_destination_address_prefix
  }

  tags = var.tags
}

resource "azurerm_network_interface" "jumpbox-nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.jumpbox-rg.location
  resource_group_name = azurerm_resource_group.jumpbox-rg.name

  ip_configuration {
    name                          = var.ipconfig_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.jumpbox-nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

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
    public_key = var.public_key

  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage.primary_blob_endpoint
  }

  tags = var.tags
}


#todo --- add block to peer the Jumpbox VNET to the AKS VNET