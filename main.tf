// ubuntu 18.04
// m5a.large
// 2 cpus, 8gb ram, 20gbb hdd
variable "project_id" {
  type = string
}

variable "region" {
  type = string
  default = "us-west1"
}

variable "zone_letter" {
  type = string
  default = "a"
}

variable "cloud_build_account" {
  type = string
}

variable "account_b" {
  type = string
}

variable "account_c" {
  type = string
}

locals {
  zone = join("-", [var.region, var.zone_letter])
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.69.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

module "build" {
  source = "./build"
  zone = local.zone
  cloud_build_account = var.cloud_build_account
  account_b = var.account_b
  account_c = var.account_c
}
