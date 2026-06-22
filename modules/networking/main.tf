resource "azurerm_virtual_network" "vnetdetails" {
  name                = var.vnet_config.name
  location            = var.vnet_config.location
  resource_group_name = var.rg_det.name
  address_space       = var.vnet_config.address_space
}

resource "azurerm_subnet" "subnetdetails" {
  name                 = var.subnet_config.name
  resource_group_name  = var.rg_det.name
  virtual_network_name = var.vnet_config.name
  address_prefixes     = var.subnet_config.address_prefixes
}

resource "azurerm_network_security_group" "nsgdetails" {
  name                = var.nsg_config.name
  location            = var.vnet_config.location
  resource_group_name = var.rg_det.name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-http"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
  subnet_id                 = azurerm_subnet.subnetdetails.id
  network_security_group_id = azurerm_network_security_group.nsgdetails.id
}

resource "azurerm_public_ip" "publicip_details" {
  name                = "${var.linux_vm.name}-pip"
  resource_group_name = var.rg_det.name
  location            = var.vnet_config.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "interfacedetails" {
  name                = var.interface_config.name
  location            = var.vnet_config.location
  resource_group_name = var.rg_det.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetdetails.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip_details.id
  }
}

