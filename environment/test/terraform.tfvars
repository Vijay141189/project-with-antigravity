rgs = {
  rg1 = {
    name     = "resourcegroup1411-test"
    location = "southeastasia"
  }
}

storage_accounts = {
  sa1 = {
    name                     = "storageblob1411test" # Storage Account names cannot contain hyphens
    resource_group_name      = "resourcegroup1411-test"
    location                 = "southeastasia"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnets = {
  vnet1 = {
    name                = "Terraformvnet1-test"
    address_space       = ["10.0.0.0/16"]
    location            = "southeastasia"
    resource_group_name = "resourcegroup1411-test"
  }
}

subnets = {
  subnet1 = {
    name                 = "frontendsubnet1-test"
    resource_group_name  = "resourcegroup1411-test"
    virtual_network_name = "Terraformvnet1-test"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backendsubnet1-test"
    resource_group_name  = "resourcegroup1411-test"
    virtual_network_name = "Terraformvnet1-test"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    name                 = "dbsubnet1-test"
    resource_group_name  = "resourcegroup1411-test"
    virtual_network_name = "Terraformvnet1-test"
    address_prefixes     = ["10.0.3.0/24"]
  }
}

public_ips = {
  public_ip1 = {
    name                = "publicip1-test"
    resource_group_name = "resourcegroup1411-test"
    location            = "southeastasia"
    allocation_method   = "Static"
  }
  public_ip2 = {
    name                = "publicip2-test"
    resource_group_name = "resourcegroup1411-test"
    location            = "southeastasia"
    allocation_method   = "Static"
  }
  public_ip3 = {
    name                = "publicip3-test"
    resource_group_name = "resourcegroup1411-test"
    location            = "southeastasia"
    allocation_method   = "Static"
  }
}

vms = {
  vm1 = {
    name                 = "vm-1-test"
    resource_group_name  = "resourcegroup1411-test"
    location             = "southeastasia"
    size                 = "Standard_B1ms"
    admin_username       = "adminuser"
    subnet_name          = "frontendsubnet1-test"
    public_ip_name       = "publicip1-test"
    virtual_network_name = "Terraformvnet1-test"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    offer                = "UbuntuServer"
    sku                  = "18.04-LTS"
    version              = "latest"
    publisher            = "Canonical"
  }
  vm2 = {
    name                 = "vm-2-test"
    resource_group_name  = "resourcegroup1411-test"
    location             = "southeastasia"
    size                 = "Standard_B1ms"
    admin_username       = "adminuser"
    subnet_name          = "backendsubnet1-test"
    public_ip_name       = "publicip2-test"
    virtual_network_name = "Terraformvnet1-test"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    offer                = "UbuntuServer"
    sku                  = "18.04-LTS"
    version              = "latest"
    publisher            = "Canonical"
  }
  vm3 = {
    name                 = "vm-3-test"
    resource_group_name  = "resourcegroup1411-test"
    location             = "southeastasia"
    size                 = "Standard_B1ms"
    admin_username       = "adminuser"
    subnet_name          = "dbsubnet1-test"
    public_ip_name       = "publicip3-test"
    virtual_network_name = "Terraformvnet1-test"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    offer                = "UbuntuServer"
    sku                  = "18.04-LTS"
    version              = "latest"
    publisher            = "Canonical"
  }
}

key_vaults = {
  key_vault1 = {
    name                        = "keyvault1411-test"
    resource_group_name        = "resourcegroup1411-test"
    location                   = "southeastasia"
    sku_name                    = "standard"
    purge_protection_enabled    = true
    soft_delete_retention_days  = 7
    tenant_id                   = "37a7890a-efe4-4836-9716-c9bdee7d3e79"
    object_id                   = "c3dfc03d-6b32-4dea-8983-d2cf88ff7f92"
  }
}

private_endpoints = {
  pe_storage = {
    name                           = "pe-storage-test"
    resource_group_name            = "resourcegroup1411-test"
    location                       = "southeastasia"
    subnet_name                    = "backendsubnet1-test"
    virtual_network_name           = "Terraformvnet1-test"
    target_resource_name           = "storageblob1411test"
    target_resource_type           = "storage_account"
    subresource_names              = ["blob"]
  }
  pe_keyvault = {
    name                           = "pe-keyvault-test"
    resource_group_name            = "resourcegroup1411-test"
    location                       = "southeastasia"
    subnet_name                    = "backendsubnet1-test"
    virtual_network_name           = "Terraformvnet1-test"
    target_resource_name           = "keyvault1411-test"
    target_resource_type           = "key_vault"
    subresource_names              = ["vault"]
  }
}
