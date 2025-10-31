
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # To allow traffic from the entire internet
  source_ranges = ["0.0.0.0/0"]

  target_tags = ["allow-http"]

}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  # To allow traffic from the entire internet
  source_ranges = ["0.0.0.0/0"]

  target_tags = ["allow-https"]

}
