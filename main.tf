// Configure the Google Cloud provider
provider "google" {
 credentials = file("~/.ssh/terraform_gcp_account.json")
 project     = "kube-fun-271414"
 region      = "us-west1"

}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8

}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-west1-a"
 provisioner "local-exec" {
 command = "sleep 15; ansible-playbook -i'${google_compute_instance.default.network_interface.0.access_config.0.nat_ip},' main.yml"
                }  
 tags = ["http-server"]
 metadata = {
   ssh-keys = "centos:${file("~/.ssh/google_compute_engine.pub")}"
 }

// boot_disk {
// initialize_params {
//      image = "debian-cloud/debian-9"
//    
// }
boot_disk {
initialize_params {
     image = "centos-cloud/centos-7"
        }
    }
//  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

// metadata_startup_script = "sudo yum -y update; sudo yum install -y "


network_interface {
   network = "default"

access_config {
     // Include this section to give the VM an external ip address
   
}
}
}

// resource "google_compute_firewall" "default" {
//   name    = "vm-firewall"
//   network = google_compute_network.default.name
// 
// allow {
//     protocol = "tcp"
//     ports    = ["80"]
//     //ports    = ["80", "8080", "1000-2000"]
//   
// }
// 
//   source_tags = ["web"]
// 
// }
// resource "google_compute_network" "default" {
//   name = "vm-network"
// 
// }
