#********************************************************************************************
# Copyright (c) 2019,2020,2021 Oracle and/or its affiliates. All rights reserved.
#********************************************************************************************

module "network" {
    source = "./modules/network"
    display_name_prefix = var.new_network_prefix
    compartment_id      = var.compartment_ocid
    tenancy_ocid        = var.tenancy_ocid
    vcn_cidr            = var.new_vcn_cidr
    subnet_cidr         = var.new_subnet_cidr
    dns_label           = var.new_network_prefix
    network_enabled     = var.option_network != "Existing networking components will be used" ? true : false
}

module "compute" {
    source = "./modules/compute"
    region                = var.region
    compartment_id        = var.compartment_ocid
    availability_domain   = var.instance_availability_domain
    instance_name         = var.instance_name
    ssh_authorized_keys   = var.ssh_public_key
    shape                 = var.instance_shape
    subnet_id             = var.option_network != "Existing networking components will be used" ? module.network.subnet_id : var.network_subnet_id
    db_db_name            = var.db_db_name
    db_admin_password     = var.db_password
    db_app_password       = var.db_password
    tenancy_ocid          = var.tenancy_ocid
    extract_from_date     = var.extract_from_date
    extract_tag_special_key = var.extract_tag_special_key
    db_wallet             = module.adb.wallet
    image_option          = var.image_option
    image_id              = var.image_option == "market" ? var.mp_listing_resource_id : var.custom_image_id
    mp_listing_id         = var.mp_listing_id
    mp_listing_resource_version = var.mp_listing_resource_version
}

module "adb" {
    source = "./modules/adb"
    compartment_id      = var.compartment_ocid
    admin_password      = var.db_password
    db_name             = var.db_db_name
    license_model       = var.db_license_model
    db_wallet_password  = var.db_password
    is_free_tier        = var.db_is_free_tier
}

module "iam" {
    source = "./modules/iam"
    iam_enabled         = var.option_iam == "New IAM Dynamic Group and Policy will be created"
    tenancy_ocid        = var.tenancy_ocid
    policy_name         = var.new_policy_name
    dynamic_group_name  = var.new_dynamic_group_name
    dynamic_group_matching_rule = "ALL {instance.id = '${module.compute.compute_id}'}"
}


#********************************************************************************************
# Outputs
#********************************************************************************************

output "APEX_Admin_Workspace_URL" {
  value = module.adb.apex_url
}

output "APEX_Application_Login_URL" {
  value = replace(module.adb.apex_url,"apex","f?p=100:LOGIN_DESKTOP::::::")
}

output "ADWC_Service_Console_URL" {
  value = module.adb.adwc_console
}

output "VM_Private_IP" {
  value = module.compute.private_ip
}

output "VM_Public_IP" {
  value = module.compute.public_ip
}

output "ZZZ_Instructions" {
  value = "Please login to the VM under opc user and check the file setup.log for any errors and continue login to APEX Application URL"
}

output "VM_OS_Image" {
  value = module.compute.usage_image
}