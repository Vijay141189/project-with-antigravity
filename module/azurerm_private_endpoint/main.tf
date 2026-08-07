resource "azurerm_private_endpoint" "pe" {
  for_each            = var.private_endpoints
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet[each.key].id

  private_service_connection {
    name                           = "${each.value.name}-connection"
    private_connection_resource_id = each.value.target_resource_type == "storage_account" ? data.azurerm_storage_account.sa[each.key].id : data.azurerm_key_vault.kv[each.key].id
    subresource_names              = each.value.subresource_names
    is_manual_connection           = false
  }
}
