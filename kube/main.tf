# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = "snappy-boulder-476716-s6"
  name                       = "gke-test-1"
  region                     = "us-central1"
  zones                      = ["us-central1-a", "us-central1-b", "us-central1-f"]
  deletion_protection        = false
  network                    = "default"
  subnetwork                 = "default"
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false
  #filestore_csi_driver       = false
  #dns_cache                  = false

  node_pools = [
    {
      name         = "default-node-pool"
      machine_type = "n1-standard-2"
      #node_locations              = "us-central1-b,us-central1-c"
      min_count = 1
      max_count = 2 # quota errors if the number is too high
      #local_ssd_count             = 0
      #spot                        = false
      disk_size_gb = 12
      disk_type    = "pd-standard"
      image_type   = "COS_CONTAINERD"
      #enable_gcfs                 = false
      #enable_gvnic                = false
      #logging_variant             = "DEFAULT"
      auto_repair  = true
      auto_upgrade = true
      #service_account    = "project-service-account@snappy-boulder-476716-s6.iam.gserviceaccount.com"
      preemptible        = false
      initial_node_count = 1
      #accelerator_count           = 1
      #accelerator_type            = "nvidia-l4"
      #gpu_driver_version          = "LATEST"
      #gpu_sharing_strategy        = "TIME_SHARING"
      #max_shared_clients_per_gpu = 2
    },
  ]

  node_pools_oauth_scopes = {
    /*all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]*/
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = "true"
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  #  node_pools_taints = {
  #    all = []
  #
  #    default-node-pool = [
  #      {
  #        key    = "default-node-pool"
  #        value  = "true"
  #        effect = "PREFER_NO_SCHEDULE"
  #      },
  #    ]
  #  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
