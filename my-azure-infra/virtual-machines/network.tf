# Create a virtual network and subnet for linux-vm
resource "azurerm_virtual_network" "linux-vm" {
  name                = var.linux-vm_vnet_name
  address_space       = var.linux-vm_address_space
  location            = azurerm_resource_group.linux-vm-rg.location
  resource_group_name = azurerm_resource_group.linux-vm-rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.linux-vm_subnet_name
  resource_group_name  = azurerm_resource_group.linux-vm-rg.name
  virtual_network_name = azurerm_virtual_network.linux-vm.name
  address_prefixes     = var.linux-vm_address_prefixes
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.linux-vm-rg.location
  resource_group_name = azurerm_resource_group.linux-vm-rg.name
  allocation_method   = var.ip_allocation_method
  tags                = var.tags
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.linux-vm-rg.location
  resource_group_name = azurerm_resource_group.linux-vm-rg.name

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

resource "azurerm_network_interface" "linux-vm-nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.linux-vm-rg.location
  resource_group_name = azurerm_resource_group.linux-vm-rg.name

  ip_configuration {
    name                          = var.ipconfig_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = var.tags
}

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.linux-vm-nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}