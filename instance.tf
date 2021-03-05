resource "google_compute_instance" "vm" {
  count                     = terraform.workspace == "prd" ? 5 : (terraform.workspace == "dev" ? 1 : 3)
  name                      = format("%s-%s-${count.index}", terraform.workspace, var.vm-name)
  machine_type              = var.machine_type
  zone                      = var.zone
  allow_stopping_for_update = var.allow-stop

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    ssh-keys = var.ssh
  }
  metadata_startup_script = var.startup-script
}
