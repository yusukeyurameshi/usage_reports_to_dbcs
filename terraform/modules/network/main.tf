#********************************************************************************************
# Copyright (c) 2019,2020,2021 Oracle and/or its affiliates. All rights reserved.
#********************************************************************************************

############################################
# Variables
############################################
locals {
  all_cidr = "0.0.0.0/0"
}

variable "compartment_id" {}
variable "tenancy_ocid" {}
variable "vcn_cidr" {}
variable "subnet_cidr" {}
variable "display_name_prefix" {}
variable "dns_label" {}
variable "network_enabled" {}

############################################
# VCN
############################################
resource "oci_core_vcn" "vcn" {
  count          = var.network_enabled ? 1 : 0
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_id
  display_name   = "${var.display_name_prefix}-vcn"
  dns_label      = var.dns_label
}

############################################
# IGW
############################################
resource "oci_core_internet_gateway" "internet_gateway" {
  count          = var.network_enabled ? 1 : 0
  compartment_id = var.compartment_id
  display_name   = "${var.display_name_prefix}-igw"
  vcn_id         = oci_core_vcn.vcn[count.index].id
}

############################################
# SecList
############################################
resource "oci_core_security_list" "seclist" {
  count          = var.network_enabled ? 1 : 0
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[count.index].id
  display_name   = "${var.display_name_prefix}-security-list"

  ingress_security_rules {
    protocol  = "6" // tcp
    source    = local.all_cidr
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol  = 1
    source    = local.all_cidr
    stateless = false

    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    protocol  = "all"
    source    = var.vcn_cidr
    stateless = false
  }
  
  egress_security_rules {
    // Allow all outbound traffic
    destination      = local.all_cidr
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }
}

############################################
# Subnet
############################################
resource "oci_core_subnet" "subnet" {
  count           = var.network_enabled ? 1 : 0
  compartment_id  = var.compartment_id
  vcn_id          = oci_core_vcn.vcn[count.index].id
  display_name    = "${var.display_name_prefix}-subnet"
  cidr_block      = var.subnet_cidr
  dhcp_options_id = oci_core_vcn.vcn[count.index].default_dhcp_options_id
  dns_label       = var.display_name_prefix
  prohibit_public_ip_on_vnic = false

  security_list_ids = [
    oci_core_security_list.seclist[count.index].id
  ]
}

############################################
# Route
############################################
resource "oci_core_route_table" "route-table" {
  count          = var.network_enabled ? 1 : 0
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[count.index].id
  display_name   = "${var.display_name_prefix}-route-table"

  route_rules {
    destination       = local.all_cidr
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway[count.index].id
  }
}

resource "oci_core_route_table_attachment" "route-table" {
  count          = var.network_enabled  ? 1 : 0
  subnet_id      = oci_core_subnet.subnet[count.index].id
  route_table_id = oci_core_route_table.route-table[count.index].id
}

############################################
# Output
############################################
output "subnet_id" {
  value = join(",",oci_core_subnet.subnet.*.id)
}