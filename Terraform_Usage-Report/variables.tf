##########################
# Version
##########################
terraform {
  required_version = ">= 0.12.0"
}

##########################
# Provider
##########################
provider "oci" {
  region = var.region
}

variable "tenancy_ocid"     {}
variable "region"           {}
variable "compartment_ocid" {}

##########################
# IAM
##########################
variable "option_iam" {}
variable "new_policy_name"               {  default = "" }
variable "new_dynamic_group_name"        {  default = "" }

##########################
# Network
##########################
variable "option_network"                { default = "" }
variable "new_network_prefix"            { default = "" }
variable "new_vcn_cidr"                  { default = "" }
variable "new_subnet_cidr"               { default = "" }
variable "network_vcn_compartment_id"    { default = "" }
variable "network_vcn_id"                { default = "" }
variable "network_subnet_compartment_id" { default = "" }
variable "network_subnet_id"             { default = "" }

##########################
# Database
##########################

variable "db_db_name"         { default = "" }
variable "db_password"        { default = "" }
variable "db_license_model"   { default = "" }

variable "db_is_free_tier" {
  type    = bool
  default = false
}

##########################
# Compute
##########################
variable "ssh_public_key"               { default = "" }
variable "instance_shape"               { default = "" }
variable "instance_name"                { default = "" }
variable "instance_availability_domain" { default = "" } 
variable "extract_from_date"            { default = "" } 
variable "extract_tag_special_key"      { default = "" }

##########################
# Image Options
##########################

variable "image_option" {
   default = "market"
#   default = "custom"
#   default = "oracle"
}

variable "custom_image_id" {
    default = "ocid1.image.oc1.iad.aaaaaaaafoaiigfairqe2ke2gx76dxfmx3zofvqyg5qandabimcxk6a2hvwa"
}
variable "mp_listing_id" {
    default = "ocid1.appcataloglisting.oc1..aaaaaaaan7kzlumlptcwug5cvdblvsahqk6ucvjpbhvdpmyj2xlcsds6vjxq"
}
variable "mp_listing_resource_id" {
    default = "ocid1.image.oc1..aaaaaaaazx4qvppbtbpaeup5sldkot43wvbcqejqsllblvqxgubfronef65a"
}
variable "mp_listing_resource_version" {
    default = "21.05.25"
}

variable "mp_subscription_enabled" {
  description = "Subscribe to Marketplace listing?"
  type        = bool
  default     = true
}