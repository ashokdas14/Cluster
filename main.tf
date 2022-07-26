module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gcp_cluster_name
  region                     = var.gcp_region
  ip_range_pods              = ""
  ip_range_services          = ""
  zones                      = var.gcp_zones
  network                    = var.gcp_network
  subnetwork                 = var.gcp_subnetwork
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false

  node_pools = [
    {
      name               = var.gcp_nodepool_name
      machine_type       = var.gcp_machine_type
      min_count          = 1
      max_count          = 6
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = var.gcp_disk_type
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.gcp_service_account
      preemptible        = false
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
