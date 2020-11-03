resource "google_compute_address" "static-spoke1" {
  name = "spoke1-ipv4-address"
}

resource "google_compute_address" "static-spoke2" {
  name = "spoke2-ipv4-address"
}

resource "google_compute_address" "static-hub1" {
  name = "hub1-ipv4-address"
}

resource "google_compute_instance" "spoke1" {

    name = "ngfw-spoke1"
    machine_type = "n1-standard-4"
    zone = data.google_compute_zones.available.names[0]
    can_ip_forward = true
    allow_stopping_for_update = true

    metadata = {
        serial-port-enable = true
        ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
    }

    tags = ["spoke1"]

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
	network_ip = "192.168.100.101"
 	access_config {
	    nat_ip = google_compute_address.static-spoke1.address
        }
    }

    network_interface {
	subnetwork = google_compute_subnetwork.vnet-fiber-spoke1-net.name
	network_ip = "198.18.1.100"
    }
   
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-lte-spoke1-net.name
	network_ip = "198.19.1.100"
    }
   
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-linux1-net.name
	network_ip = "192.168.1.100"
    }

    boot_disk {
        initialize_params {
            #image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-byol-810"
	    image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-flex-byol-1000"
        }
    }
}

resource "google_compute_instance" "spoke2" {

    name = "ngfw-spoke2"
    machine_type = "n1-standard-4"
    zone = data.google_compute_zones.available.names[0]
    can_ip_forward = true
    allow_stopping_for_update = true

    metadata = {
        serial-port-enable = true
        ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
    }

    tags = ["spoke2"]

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
	network_ip = "192.168.100.102"
 	access_config {
	    nat_ip = google_compute_address.static-spoke2.address
        }
    }

    network_interface {
	subnetwork = google_compute_subnetwork.vnet-fiber-spoke2-net.name
	network_ip = "198.18.2.100"
    }
   
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-lte-spoke2-net.name
	network_ip = "198.19.2.100"
    }
   
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-linux2-net.name
	network_ip = "192.168.2.100"
    }

    boot_disk {
        initialize_params {
            #image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-byol-810"
            image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-flex-byol-1000"
        }
    }
}

resource "google_compute_instance" "hub1" {

    name = "ngfw-hub1"
    machine_type = "n1-standard-4"
    zone = data.google_compute_zones.available.names[0]
    can_ip_forward = true
    allow_stopping_for_update = true

    metadata = {
        serial-port-enable = true
        ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
    }

    tags = ["hub1"]

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
	network_ip = "192.168.100.100"
 	access_config {
	    nat_ip = google_compute_address.static-hub1.address
        }
    }

    network_interface {
	subnetwork = google_compute_subnetwork.vnet-fiber-hub1-net.name
	network_ip = "198.18.0.100"
    }
   
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-lte-hub1-net.name
	network_ip = "198.19.0.100"
    }
   
    network_interface {
	subnetwork = google_compute_subnetwork.vnet-dc1-net.name
	network_ip = "192.168.0.100"
    }

    boot_disk {
        initialize_params {
            #image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-byol-810"
            image = "https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-flex-byol-1000"
        }
    }
}
