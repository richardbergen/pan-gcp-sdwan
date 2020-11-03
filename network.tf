resource "google_compute_network" "vnet-linux1" {
  name          =  "vnet-linux1"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-linux2" {
  name          =  "vnet-linux2"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-dc1" {
  name          =  "vnet-dc1"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-mgmt" {
  name          =  "vnet-mgmt"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-fiber-spoke1" {
  name          =  "vnet-fiber-spoke1"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-lte-spoke1" {
  name          =  "vnet-lte-spoke1"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-fiber-spoke2" {
  name          =  "vnet-fiber-spoke2"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-lte-spoke2" {
  name          =  "vnet-lte-spoke2"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-fiber-hub1" {
  name          =  "vnet-fiber-hub1"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "vnet-lte-hub1" {
  name          =  "vnet-lte-hub1"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "vnet-linux1-net" {
  name          =  "vnet-linux1-net"
  ip_cidr_range = var.vnet-linux1-cidr
  network      = google_compute_network.vnet-linux1.id
  #region        = var.var_region_name
}

resource "google_compute_subnetwork" "vnet-linux2-net" {
  name          =  "vnet-linux2-net"
  ip_cidr_range = var.vnet-linux2-cidr
  network      = google_compute_network.vnet-linux2.id
  #region        = var.var_region_name
}

resource "google_compute_subnetwork" "vnet-dc1-net" {
  name          =  "vnet-dc1-net"
  ip_cidr_range = var.vnet-dc1-cidr
  network      = google_compute_network.vnet-dc1.id
  #region        = var.var_region_name
}

resource "google_compute_subnetwork" "vnet-mgmt-net" {
  name          =  "vnet-mgmt-net"
  ip_cidr_range = var.vnet-mgmt-cidr
  network      = google_compute_network.vnet-mgmt.id
  #region        = var.var_region_name
}

resource "google_compute_subnetwork" "vnet-fiber-spoke1-net" {
  name          =  "vnet-fiber-spoke1-net"
  ip_cidr_range = var.vnet-fiber-spoke1-cidr
  network       = google_compute_network.vnet-fiber-spoke1.id
  #region        = "${var.var_region_name}"
}

resource "google_compute_subnetwork" "vnet-lte-spoke1-net" {
  name          =  "vnet-lte-spoke1-net"
  ip_cidr_range = var.vnet-lte-spoke1-cidr
  network       = google_compute_network.vnet-lte-spoke1.id
  #region        = "${var.var_region_name}"
}

resource "google_compute_subnetwork" "vnet-fiber-spoke2-net" {
  name          =  "vnet-fiber-spoke2-net"
  ip_cidr_range = var.vnet-fiber-spoke2-cidr
  network       = google_compute_network.vnet-fiber-spoke2.id
  #region        = "${var.var_region_name}"
}

resource "google_compute_subnetwork" "vnet-lte-spoke2-net" {
  name          =  "vnet-lte-spoke2-net"
  ip_cidr_range = var.vnet-lte-spoke2-cidr
  network       = google_compute_network.vnet-lte-spoke2.id
  #region        = "${var.var_region_name}"
}

resource "google_compute_subnetwork" "vnet-fiber-hub1-net" {
  name          =  "vnet-fiber-hub1-net"
  ip_cidr_range = var.vnet-fiber-hub1-cidr
  network       = google_compute_network.vnet-fiber-hub1.id
  #region        = "${var.var_region_name}"
}

resource "google_compute_subnetwork" "vnet-lte-hub1-net" {
  name          =  "vnet-lte-hub1-net"
  ip_cidr_range = var.vnet-lte-hub1-cidr
  network       = google_compute_network.vnet-lte-hub1.id
  #region        = "${var.var_region_name}"
}

resource "google_compute_route" "linux1-192-168-route" {
  name        = "linux1-192-168-route"
  dest_range  = "192.168.0.0/16"
  network     = google_compute_network.vnet-linux1.name
  next_hop_ip = "192.168.1.100"
  priority    = 100
}

resource "google_compute_route" "linux2-192-168-route" {
  name        = "linux2-192-168-route"
  dest_range  = "192.168.0.0/16"
  network     = google_compute_network.vnet-linux2.name
  next_hop_ip = "192.168.2.100"
  priority    = 100
}

resource "google_compute_route" "dc1-192-168-route" {
  name        = "dc1-192-168-route"
  dest_range  = "198.168.0.0/16"
  network     = google_compute_network.vnet-dc1.name
  next_hop_ip = "192.168.0.100"
  priority    = 100
}

resource "google_compute_route" "linux1-198-18-route" {
  name        = "linux1-198-18-route"
  dest_range  = "198.18.0.0/16"
  network     = google_compute_network.vnet-linux1.name
  next_hop_ip = "192.168.1.100"
  priority    = 100
}

resource "google_compute_route" "linux2-198-18-route" {
  name        = "linux2-198-18-route"
  dest_range  = "198.18.0.0/16"
  network     = google_compute_network.vnet-linux2.name
  next_hop_ip = "192.168.2.100"
  priority    = 100
}

resource "google_compute_route" "dc1-198-18-route" {
  name        = "dc1-198-18-route"
  dest_range  = "198.18.0.0/16"
  network     = google_compute_network.vnet-dc1.name
  next_hop_ip = "192.168.0.100"
  priority    = 100
}
