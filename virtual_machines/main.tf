locals {
  name = "list-${var.name1}-${var.name2}-${var.name3}"
}


resource "google_compute_instance" "default" {
  count          = var.machine_count # "${length(var.name_count)}"
  name           = local.name        # "list-${count.index + 1}"
  machine_type   = var.machine_type["prod"]
  zone           = var.zone
  can_ip_forward = "false"
  description    = "This is ur VM"

  tags = ["allow-http", "allow-https"] #FIREWALL

  # --- Required Blocks ---
  boot_disk {
    initialize_params {
      image = var.image # "${var.image}"
      size  = "10"
    }
  }

  labels = {
    name         = "list-${count.index + 1}"
    machine_type = var.environment == "production" ? var.machine_type["prod"] : var.machine_type_dev # var.machine_type["prod"]

  }

  # 2. Network Interface Configuration
  network_interface {
    network = "default"
  }

  metadata = {
    size = "20"
    foo  = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  # depends_on = [ google_compute_instance.second ]
}

/*resource "google_compute_instance" "second" {
  count        = "1"
  name         = "second-${count.index + 1}"
  machine_type = var.machine_type["prod"]
  zone         = "europe-west1-b"

  # --- Required Blocks ---
  boot_disk {
    initialize_params {
      image = var.image # "${var.image}"
    }
  }

  # 2. Network Interface Configuration
  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}*/

output "machine_type" {
  value = google_compute_instance.default.*.machine_type
}

output "name" {
  value = google_compute_instance.default.*.name
}

output "zone" {
  value = google_compute_instance.default.*.zone
}

output "instance_id" {
  value = join(",", google_compute_instance.default.*.id)
}
