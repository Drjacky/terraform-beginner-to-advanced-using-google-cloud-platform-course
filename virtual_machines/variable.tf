variable "image" { default = "ubuntu-os-cloud/ubuntu-2404-lts-arm64" }
variable "machine_type" {
  type = map(string)
  default = {
    "prod"    = "n1-standard-1"
    "sandbox" = "prod_wont_work"
  }
}
variable "machine_type_dev" {
  default = "n1-standard-4"
}

variable "name_count" {
  default = ["server1", "server2", "server3"]
}
variable "environment" {
  default = "production"
}

variable "name1" { default = "name1" }
variable "name2" { default = "name2" }
variable "name3" { default = "name3" }
variable "machine_count" { default = "1" }
variable "zone" { default = "europe-west1-b" }
