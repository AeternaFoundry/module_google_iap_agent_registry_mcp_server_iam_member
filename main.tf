resource "google_iap_agent_registry_mcp_server_iam_member" "iap_agent_registry_mcp_server_iam_members" {
  for_each = var.iap_agent_registry_mcp_server_iam_members

  mcp_server_id = each.value.mcp_server_id
  member        = each.value.member
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

