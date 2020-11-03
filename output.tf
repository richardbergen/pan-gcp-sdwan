output "spoke1-pub-ip" {
  value = google_compute_address.static-spoke1.address
}

output "spoke2-pub-ip" {
  value = google_compute_address.static-spoke2.address
}

output "hub1-pub-ip" {
  value = google_compute_address.static-hub1.address
}

output "Desktop_DC1_Public_IP" {
  value = google_compute_instance.dc1desktop.network_interface[0].access_config[0].nat_ip
}

output "Desktop_Linux1_Public_IP" {
  value = google_compute_instance.linuxdesktop1.network_interface[0].access_config[0].nat_ip
}

output "Desktop_Linux2_Public_IP" {
  value = google_compute_instance.linuxdesktop2.network_interface[0].access_config[0].nat_ip
}

output "Shaper1_Public_IP" {
  value = google_compute_instance.shaper1.network_interface[0].access_config[0].nat_ip
}

output "Shaper2_Public_IP" {
  value = google_compute_instance.shaper2.network_interface[0].access_config[0].nat_ip
}

output "Panorama" {
  value = google_compute_instance.panorama.network_interface[0].access_config[0].nat_ip
}
