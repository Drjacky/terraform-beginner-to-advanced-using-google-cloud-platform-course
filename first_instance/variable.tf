variable "image" { default = "ubuntu-os-cloud/ubuntu-2404-lts-arm64" }
variable "machine_type" { 
    type = map(string)
    default = {
        "dev" = "n1-standard-1"
        "prod" = "wont_work"
     }
}
variable "name_count" {
  default = ["server1", "server2", "server3"]
}