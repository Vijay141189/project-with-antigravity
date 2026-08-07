variable "private_endpoints" {
  description = "Map of private endpoint configurations"
  type = map(object({
    name                           = string
    resource_group_name            = string
    location                       = string
    subnet_name                    = string
    virtual_network_name           = string
    target_resource_name           = string
    target_resource_type           = string # "storage_account" or "key_vault"
    subresource_names              = list(string)
  }))
}
