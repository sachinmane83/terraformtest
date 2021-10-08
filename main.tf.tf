provider "google" {
  project     = "responsive-gist-322605"
  region      = "us-central1"
  zone        = "us-central1-a"

}

resource "google_compute_instance" "vm_instance" {
      name         = "gcptutorials-vm1"
      machine_type = "f1-micro"
    
      boot_disk {
        initialize_params {
          image = "debian-cloud/debian-9"
        }
      }    
      network_interface {       
        network = "default"
        access_config {
        }
      }
    }
    
  
