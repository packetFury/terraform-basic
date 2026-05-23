variable "proxmox_api_url" {
  type        = string
  description = "The API endpoint for the Proxmox cluster"
}

variable "proxmox_api_token_id" {
  type        = string
  description = "The Proxmox Token ID"
}

variable "proxmox_api_token_secret" {
  type        = string
  sensitive   = true
  description = "The secret key associated with the Proxmox API token"
}
