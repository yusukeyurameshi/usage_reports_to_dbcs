#********************************************************************************************
# Copyright (c) 2019,2020,2021 Oracle and/or its affiliates. All rights reserved.
#********************************************************************************************

#*****************************
# Variables
#*****************************

variable "compartment_id" {}
variable "region" {}
variable "availability_domain" {}
variable "instance_name" {}
variable "ssh_authorized_keys" {}
variable "shape" {}
variable "subnet_id" {}
variable "db_db_name" {}
variable "db_admin_password" {}
variable "db_app_password" {}
variable "db_wallet" {}
variable "extract_from_date" {}
variable "extract_tag_special_key" {}
variable "tenancy_ocid" {}

variable "image_option" {}
variable "image_id" {}
variable "mp_listing_id" {}
variable "mp_listing_resource_version" {}

#*****************************
# Subnet Query
#*****************************
data "oci_core_subnet" "subnet" {
  subnet_id = var.subnet_id
}

#*****************************
# Images
#*****************************
data "oci_core_images" "usage_image" {
  compartment_id = var.compartment_id
	operating_system = "Oracle Linux"
	operating_system_version = "7.8"
	filter {
		name = "display_name"
		values = ["^([a-zA-z]+)-([a-zA-z]+)-([\\.0-9]+)-([\\.0-9-]+)$"]
		regex = true
	}
}

#*****************************
# Instance
#*****************************
resource "oci_core_instance" "usagevm" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = var.instance_name
  shape               = var.shape

  create_vnic_details {
    subnet_id          = data.oci_core_subnet.subnet.subnet_id
    assign_public_ip   = !data.oci_core_subnet.subnet.prohibit_public_ip_on_vnic
  }
  
  source_details {
    source_type = "image"
    source_id = var.image_option == "oracle" ? data.oci_core_images.usage_image.images.0.id : var.image_id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys
    user_data            = base64encode(templatefile("${path.module}/bootstrap.tpl", { 
      db_db_name         = var.db_db_name, 
      db_admin_password  = var.db_admin_password, 
      db_app_password    = var.db_app_password,  
      extract_from_date  = var.extract_from_date,
      extract_tag_special_key  = var.extract_tag_special_key,
      image_option       = var.image_option
      }))
  }

  extended_metadata = {
    wallet_file         = var.db_wallet
  }

  timeouts {
    create = "30m"
  }

  preserve_boot_volume = false
}

###############################################
# Marketplace Image
###############################################
resource "oci_core_app_catalog_listing_resource_version_agreement" "image_agreement" {
  count                    = var.image_option == "market" ? 1 : 0
  listing_id               = var.mp_listing_id
  listing_resource_version = var.mp_listing_resource_version
}

resource "oci_core_app_catalog_subscription" "image_subscription" {
  count                    = var.image_option == "market" ? 1 : 0
  compartment_id           = var.compartment_id
  eula_link                = oci_core_app_catalog_listing_resource_version_agreement.image_agreement[count.index].eula_link
  listing_id               = oci_core_app_catalog_listing_resource_version_agreement.image_agreement[count.index].listing_id
  listing_resource_version = oci_core_app_catalog_listing_resource_version_agreement.image_agreement[count.index].listing_resource_version
  oracle_terms_of_use_link = oci_core_app_catalog_listing_resource_version_agreement.image_agreement[count.index].oracle_terms_of_use_link
  signature                = oci_core_app_catalog_listing_resource_version_agreement.image_agreement[count.index].signature
  time_retrieved           = oci_core_app_catalog_listing_resource_version_agreement.image_agreement[count.index].time_retrieved

  timeouts {
    create = "20m"
  }
}

###############################################
# Output
###############################################
output "public_ip" {
  value = oci_core_instance.usagevm.public_ip
}

output "private_ip" {
  value = oci_core_instance.usagevm.private_ip
}

output "compute_id" {
  value = oci_core_instance.usagevm.id
}

output "usage_image" {
  value = var.image_option == "oracle" ? data.oci_core_images.usage_image.images.0.display_name : "custom/market"
}