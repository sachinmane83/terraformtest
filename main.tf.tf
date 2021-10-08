provider "google" {
  project     = "responsive-gist-322605"
  region      = "us-central1"
  zone        = "us-central1-a"

}

variable "config" {
  type = map(any)
  default = {
    prod = "n1-standard-1"
    dev = "f1-micro"
  }
}
variable "env" {}
#variable "apps" {
#  type = list(any)
#  default = ["app1", "app2", "app3"]

locals {

    mt = var.env == "prod" ? var.config["prod"] : var.config["dev"]

}

// Virual machine for app1

resource "google_compute_instance" "vm_instance" {

  #  count = length(var.apps)

  #  name = "myvm-${var.env}-${count.index + 1}" //  myvm-prod-1, myvm=prod-2, myvm-dev-1, myvm-dev-2

  name         = "myvm-${var.env}"
  machine_type = local.mt

  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-9"

    }

  }

  network_interface {

    network = "default"

    access_config {}

  }
}
