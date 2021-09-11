variable "region" {
  type = string
}

variable "zone_letter" {
  type        = string
  description = "Single letter to be appended to region to form zone"
}

variable "project_name" {
  type        = string
  description = "Project display name"
}

variable "project_number" {
  type = string
}

variable "project_id" {
  type = string
}

variable "sourcerepo_service" {
}

variable "cloudbuild_service" {
}
