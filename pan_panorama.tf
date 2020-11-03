resource "google_compute_instance" "panorama" {

    name = "panorama"
    machine_type = "e2-standard-8"
    zone = data.google_compute_zones.available.names[0]
    can_ip_forward = true
    allow_stopping_for_update = true

    metadata = {
        serial-port-enable = true
        ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
    }

    tags = ["panorama"]

    service_account {
        scopes = [
            "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring.write",
        ]
    }
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-mgmt-net.name
	network_ip = "192.168.100.50"
 	access_config {
        }
    }

    boot_disk {
        initialize_params {
            #image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/daniel-panorama"
	    image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/panorama-byol-1000"
        }
    }
}
