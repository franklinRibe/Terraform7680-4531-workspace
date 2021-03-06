provider "google" {
  project = "balao-magico"
  region  = "us-east1"
}
terraform {
  backend "gcs"{
    bucket = "terraform-4531-7680"
    prefix = "terraform"
  }
}

data "google_compute_subnetwork" "vpc-existente" {
  name = "vpc-existente"
  region = "us-east1"
}