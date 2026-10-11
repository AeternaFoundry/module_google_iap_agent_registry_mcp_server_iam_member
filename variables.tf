variable "iap_agent_registry_mcp_server_iam_members" {
  description = <<EOT
Map of iap_agent_registry_mcp_server_iam_members, attributes below
Required:
    - mcp_server_id
    - member
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    mcp_server_id = string
    member        = string
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

