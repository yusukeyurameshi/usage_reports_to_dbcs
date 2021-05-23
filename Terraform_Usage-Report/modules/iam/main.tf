#********************************************************************************************
# Copyright (c) 2019,2020,2021 Oracle and/or its affiliates. All rights reserved.
#********************************************************************************************

############################################
# Variables
############################################
variable "iam_enabled" {}
variable "tenancy_ocid" {}
variable "policy_name" {}
variable "dynamic_group_name" {}
variable "dynamic_group_matching_rule" {}

############################################
# Dynamic Group
############################################
resource "oci_identity_dynamic_group" "dynamic_group" {
    count          = var.iam_enabled ? 1 : 0
    compartment_id = var.tenancy_ocid
    description    = "Usage2ADW_Dynamic_Group to define the Usage2ADW Compute VM"
    matching_rule  = var.dynamic_group_matching_rule
    name           = var.dynamic_group_name
}

############################################
# Policy
############################################
resource "oci_identity_policy" "policy" {
    count          = var.iam_enabled ? 1 : 0
    compartment_id = var.tenancy_ocid
    description    = "Usage2ADW Policy to allow the VM to extract Usage and Cost Report and list compartments"
    name           = var.policy_name
    statements     = [
        "define tenancy usage-report as ocid1.tenancy.oc1..aaaaaaaaned4fkpkisbwjlr56u7cj63lf3wffbilvqknstgtvzub7vhqkggq",
        "endorse dynamic-group ${var.dynamic_group_name} to read objects in tenancy usage-report",
        "Allow dynamic-group ${var.dynamic_group_name} to inspect compartments in tenancy",
        "Allow dynamic-group ${var.dynamic_group_name} to inspect tenancies in tenancy"
    ]
    depends_on = [
        oci_identity_dynamic_group.dynamic_group
    ]

}
