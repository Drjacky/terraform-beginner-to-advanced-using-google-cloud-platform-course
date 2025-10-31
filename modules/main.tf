module "instance" {
  source = "../virtual_machines"
  zone   = "europe-west1-a"
}

module "instance_two" {
  source = "../virtual_machines"
  zone   = "europe-west1-b"
}

module "bucket" {
  source      = "../bucket"
  bucket_name = "modules-test"
}
