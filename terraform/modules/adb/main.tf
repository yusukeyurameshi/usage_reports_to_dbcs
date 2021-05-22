#********************************************************************************************
# Copyright (c) 2019,2020,2021 Oracle and/or its affiliates. All rights reserved.
#********************************************************************************************

############################################
# Variables
############################################
variable "compartment_id" {}
variable "admin_password" {}
variable "db_name" {}
variable "license_model" {}
variable "db_wallet_password" {}
variable "is_free_tier" {}

############################################
# ADWC
############################################
resource "oci_database_autonomous_database" "adwc" {
  compartment_id           = var.compartment_id
  admin_password           = var.admin_password
  cpu_core_count           = "1"
  data_storage_size_in_tbs = "1"
  db_name                  = var.db_name
  display_name             = var.db_name
  license_model            = var.is_free_tier ? "" : var.license_model
  db_version               = var.is_free_tier ? "" : "19c"
  db_workload              = "DW"
  is_auto_scaling_enabled  = "false"
  is_free_tier             = var.is_free_tier
  is_preview_version_with_service_terms_accepted = "false"
}

############################################
# Wallet
############################################
resource "oci_database_autonomous_database_wallet" "adwc_wallet" {
  autonomous_database_id   = oci_database_autonomous_database.adwc.id
  password                 = var.db_wallet_password
  base64_encode_content    = "true"
}

############################################
# Outputs
############################################

output "apex_url" {
  value = oci_database_autonomous_database.adwc.connection_urls.0.apex_url
}

output "wallet" {
  value = oci_database_autonomous_database_wallet.adwc_wallet.content
}

output "adwc_console" {
  value = oci_database_autonomous_database.adwc.service_console_url
}




