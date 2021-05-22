# Output the private and public IPs of the instance
output "InstancePrivateIP" {
  value = [data.oci_core_vnic.InstanceVnic.private_ip_address]
}

output "InstancePublicIP" {
  value = [data.oci_core_vnic.InstanceVnic.public_ip_address]
}

output "url" {
  value = ["${join("",["https://", data.oci_core_vnic.InstanceVnic.public_ip_address,":",var.com_port,"/ords/",var.target_db_name])}"]
}

