variable "image" { default = "ubuntu-os-cloud/ubuntu-2404-lts-arm64" }
variable "machine_type" { 
    type = map(string)
    default = {
        "dev" = "n1-standard-1"
        "prod" = "prod_wont_work"
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