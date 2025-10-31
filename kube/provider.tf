variable "path" {
  default = "/Users/drjacky/Projectz/my-terraform"
}

provider "google" {
  project     = "snappy-boulder-476716-s6"
  region      = "europe-west1-b"
  credentials = file("${var.path}/snappy-boulder-476716-s6-22a9a3f024e0.json")
}

provider "google-beta" {
  project     = "snappy-boulder-476716-s6"
  region      = "europe-west1-b"
  credentials = file("${var.path}/snappy-boulder-476716-s6-22a9a3f024e0.json")
}
