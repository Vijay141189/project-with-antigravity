data "azurerm_subnet" "subnet" {
  for_each             = var.private_endpoints
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_storage_account" "sa" {
  for_each            = { for k, v in var.private_endpoints : k => v if v.target_resource_type == "storage_account" }
  name                = each.value.target_resource_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = { for k, v in var.private_endpoints : k => v if v.target_resource_type == "key_vault" }
  name                = each.value.target_resource_name
  resource_group_name = each.value.resource_group_name
}
