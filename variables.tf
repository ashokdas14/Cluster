variable "gcp_credentials" {
  type        = string
  description = "Location of the credential keyfile"
}

variable "gcp_project_id" {
  type        = string
  description = "GCP Project id"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_cluster_name" {
  type        = string
  description = "Name of the cluster"
}

variable "gcp_zones" {
  type        = list(string)
  description = "GCP zones list"
}

variable "gcp_network" {
  type        = string
  description = "GCP network name"
}

variable "gcp_subnetwork" {
  type        = string
  description = "GCP Subnetwork name"
}

variable "gcp_nodepool_name" {
  type        = string
  description = "GCP node pool name"
}

variable "gcp_machine_type" {
  type        = string
  description = "GCP Machine type"
}

variable "gcp_disk_type" {
  type        = string
  description = "GCP Disk Type"
}

variable "gcp_service_account" {
  type        = string
  description = "GCP Service account name"
}

# variable "gcp_jenkins_worker"{
#     type = string
#     description = "Jenkins worker name"
# }
