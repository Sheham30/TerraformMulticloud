# Importing Resource Group
resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.resource_group_location
}

# Creating Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name = "Vnet"
    address_space = ["10.0.0.0/1"]
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

# Creating Subnet
resource "azurerm_subnet" "subnet" {
name = "Subnet"
resource_group_name = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = ["10.0.1.0/24"]
}

# Creating Network Interface
resource "azurerm_network_interface" "nic" {
    count = var.instances
    name = "NIC${count.index}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    ip_configuration {
        name = "NicConfig"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

# Creating Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
    count = var.instances
    name = "GURU-${count.index}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    network_interface_ids = [azurerm_network_interface.nic [count.index].id]
    size = "Standard_DS1_v2"
    
    admin_ssh_key {
    username = "cloud_user"
    public_key = file("C:/Users/Terminal-PAPC12/Downloads/terraform_key/abc.pub")
    }
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer = "Ubuntu"
      sku = "18.04-LTS"
      version = "latest"
    }

    computer_name = "VM-${count.index}"
    admin_username = "cloud_user"
    admin_password = "guru1234!!"
    disable_password_authentication = "false"
    
}