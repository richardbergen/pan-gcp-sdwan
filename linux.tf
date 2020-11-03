data "google_compute_image" "debian_image" {
  family  = "debian-10"
  project = "debian-cloud"
}

resource "google_compute_instance" "linuxdesktop1" {

  name         = "desktop-linux1"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-linux1-net.name
    network_ip = "192.168.1.2"
    access_config { }
  }

  metadata = {
    serial-port-enable = true
    ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
  }
 
  tags = ["linuxdesktop1"]

}

resource "google_compute_instance" "linuxdesktop2" {

  name         = "desktop-linux2"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-linux2-net.name
    network_ip = "192.168.2.2"
    access_config { }
  }

  metadata = {
    serial-port-enable = true
    ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
  }
 
  tags = ["linuxdesktop2"]

}

resource "google_compute_instance" "shaper1" {

  name         = "linux-shaper1"
  machine_type = "n1-standard-4"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-mgmt-net.name
    network_ip = "192.168.100.51"
    access_config { }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-fiber-hub1-net.name
    network_ip = "198.18.0.5"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-fiber-spoke1-net.name
    network_ip = "198.18.1.5"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-fiber-spoke2-net.name
    network_ip = "198.18.2.5"
  }

  metadata = {
    serial-port-enable = true
    ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
  }
 
  tags = ["shaper1"]
}

resource "google_compute_instance" "shaper2" {

  name         = "linux-shaper2"
  machine_type = "n1-standard-4"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-mgmt-net.name
    network_ip = "192.168.100.52"
    access_config { }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-lte-hub1-net.name
    network_ip = "198.19.0.5"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-lte-spoke1-net.name
    network_ip = "198.19.1.5"
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-lte-spoke2-net.name
    network_ip = "198.19.2.5"
  }

  metadata = {
    serial-port-enable = true
    ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
  }
 
  tags = ["shaper2"]
}

resource "google_compute_instance" "dc1desktop" {

  name         = "desktop-dc1"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.vnet-dc1-net.name
    network_ip = "192.168.0.5"
    access_config { }
  }

  metadata = {
    serial-port-enable = true
    ssh-keys = "admin:${file("${var.gcp_ssh_key}")}"
  }
 
  tags = ["dc1desktop1"]

}
