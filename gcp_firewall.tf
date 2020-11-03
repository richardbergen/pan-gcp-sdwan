resource "google_compute_firewall" "allow-all-fw-mgmt" {
  name    = "allow-fw-mgmt"
  network = google_compute_network.vnet-mgmt.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["spoke1", "spoke2", "hub1", "panorama", "shaper1", "shaper2"]

}

resource "google_compute_firewall" "allow-all-linux1" {
  name    = "allow-linux1"
  network = google_compute_network.vnet-linux1.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["linuxdesktop1", "spoke1"]
}

resource "google_compute_firewall" "allow-all-linux2" {
  name    = "allow-linux2"
  network = google_compute_network.vnet-linux2.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["linuxdesktop2", "spoke2"]
}

resource "google_compute_firewall" "allow-all-dc1" {
  name    = "allow-dc1"
  network = google_compute_network.vnet-dc1.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["dc1desktop1", "hub1"]
}

resource "google_compute_firewall" "allow-all-spoke1" {
  name    = "allow-spoke1"
  network = google_compute_network.vnet-fiber-spoke1.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["shaper1", "shaper2", "spoke1"]
}

resource "google_compute_firewall" "allow-all-spoke2" {
  name    = "allow-spoke2"
  network = google_compute_network.vnet-fiber-spoke2.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["shaper1", "shaper2", "spoke2"]
}

resource "google_compute_firewall" "allow-all-hub1" {
  name    = "allow-hub1"
  network = google_compute_network.vnet-fiber-hub1.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["shaper1", "shaper2", "hub1"]
}

resource "google_compute_firewall" "allow-all-spoke1-lte" {
  name    = "allow-spoke1-lte"
  network = google_compute_network.vnet-lte-spoke1.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["shaper1", "shaper2", "spoke1"]
}

resource "google_compute_firewall" "allow-all-spoke2-lte" {
  name    = "allow-spoke2-lte"
  network = google_compute_network.vnet-lte-spoke2.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["shaper1", "shaper2", "spoke2"]
}

resource "google_compute_firewall" "allow-all-hub1-lte" {
  name    = "allow-hub1-lte"
  network = google_compute_network.vnet-lte-hub1.id
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  target_tags = ["shaper1", "shaper2", "hub1"]
}
