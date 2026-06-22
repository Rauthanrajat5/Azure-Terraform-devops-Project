resource "azurerm_linux_virtual_machine" "vmdetails" {
  name                = var.lin_vm.name
  location            = var.lin_vm.location
  resource_group_name = var.lin_vm.resource_group_name
  size                = "Standard_D2s_v3"

  admin_username = var.lin_vm.admin_username
  admin_password = var.lin_vm.admin_password

  disable_password_authentication = false

  network_interface_ids = [var.lin_vm.network_interface_id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    name                 = "${var.lin_vm.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}