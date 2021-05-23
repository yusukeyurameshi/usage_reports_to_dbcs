resource "oci_core_instance" "ORDS-Comp-Instance" {
  availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD - 1],"name")
  compartment_id      = var.compartment_ocid
  display_name        = var.ComputeDisplayName
  shape               = var.InstanceShape

  create_vnic_details {
    subnet_id = var.subnet_ocid
    hostname_label      = var.InstanceName
  }

  metadata = {
    ssh_authorized_keys = file("./keys/Public_key_manual.pub")
    user_data           = base64encode(file(var.BootStrapFile))
  }

  source_details {
    source_id   = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaaytcynnmhb4dchwl33jdbogtix3yniig23xqe5afov4phatczbsq"
    source_type = "image"
  }

  timeouts {
    create = "60m"
  }
}

data oci_core_private_ips private_ips_by_vnic {
  #Optional
  vnic_id = data.oci_core_vnic_attachments.InstanceVnics.id
}

#resource oci_core_public_ip Public_IP{
#  compartment_id = var.compartment_ocid
#  lifetime = "Ephemeral"
#  display_name = "ORDS_IP"
#  private_ip_id = data.oci_core_private_ips.private_ips_by_vnic.id
#}