resource "azurerm_resource_group" "main" {
  name     = "rg-myftp"
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = "st${var.prefix}myftp001"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "main" {
  name                 = var.filesharename
  storage_account_name = azurerm_storage_account.main.name
  quota                = 5
}

resource "azurerm_container_group" "main" {
  name                = "aci-myftp-name"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_address_type     = "Public"
  os_type             = "Linux"
  restart_policy      = "Never"

  container {
    name   = "sftp"
    image  = "atmoz/sftp"
    cpu    = "1.0"
    memory = "1.0"

    ports {
      port     = 22
      protocol = "TCP"
    }

    secure_environment_variables = {
      SFTP_USERS = "${var.sftpuser}:${var.sftppassword}:1001"
    }

    volume {
      name       = "sftpvolume"
      mount_path = "/home/${var.sftpuser}/upload"
      read_only  = false
      share_name = var.filesharename

      storage_account_name = azurerm_storage_account.main.name
      storage_account_key  = azurerm_storage_account.main.primary_access_key
    }
  }
}
