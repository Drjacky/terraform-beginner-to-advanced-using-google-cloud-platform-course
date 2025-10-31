resource "google_compute_network" "my" {
  name                    = "my-network"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "network" {
  name          = "my-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.my.self_link
}
