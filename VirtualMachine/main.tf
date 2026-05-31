resource "azurerm_resource_group" "vmrgs" {
  #   for_each = var.rgvm
  name     = "rgforvirtualmachine"
  location = "centralindia"
}


resource "azurerm_virtual_network" "vmvnet" {
  name                = "vnet-dev"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.vmrgs.location
  resource_group_name = azurerm_resource_group.vmrgs.name
}

resource "azurerm_subnet" "subnetrohan" {
  name                 = "subnetrohan"
  resource_group_name  = azurerm_resource_group.vmrgs.name
  virtual_network_name = azurerm_virtual_network.vmvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "ip" {
  name                = "rohan-ip"
  location            = azurerm_resource_group.vmrgs.location
  resource_group_name = azurerm_resource_group.vmrgs.name
  allocation_method   = "Static"

}

resource "azurerm_network_security_group" "nsg" {
  name                = "rohan-nsg"
  location            = azurerm_resource_group.vmrgs.location
  resource_group_name = azurerm_resource_group.vmrgs.name
}

resource "azurerm_network_security_rule" "ssh" {
  name      = "sshallowed"
  priority  = 100
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range      = "*"
  destination_port_range = "22"

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.vmrgs.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_interface" "nic" {
  name                = "vm-nic"
  location            = azurerm_resource_group.vmrgs.location
  resource_group_name = azurerm_resource_group.vmrgs.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetrohan.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }

}

# attaching NSG to NIC
resource "azurerm_network_interface_security_group_association" "nsgtonic" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id

}

resource "azurerm_linux_virtual_machine" "vm" {

  name                = "dev-vm"
  resource_group_name = azurerm_resource_group.vmrgs.name
  #   location            = azurerm_resource_group.vmrgs.location
  location = "Central India"

  size = "Standard_D2s_v3"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/sshKey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}