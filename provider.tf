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
