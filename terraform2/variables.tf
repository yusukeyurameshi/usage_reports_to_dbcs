variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_ocid" {}

variable "subnet_ocid" {
  default = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaa2wbsxyplpclopspx3txgmfgupvg2iuxd5yb27ht3c5mhwzsh2nfa"
}
variable "target_db_admin_pw" {
  default = "WElcome##123"
}
variable "target_db_ip" {
  default = "127.0.0.1"
}
variable "target_db_public_ip" {
  default = "152.67.45.187"
}
variable "target_db_srv_name" {
  default = "pdb1.sub04161336580.vcn.oraclevcn.com"
}
variable "target_db_name" {
  default = "pdb1"
}

variable "com_port" {
  default = "8443"
}

variable "URL_ORDS_file" {
  default = "https://objectstorage.eu-frankfurt-1.oraclecloud.com/n/oraclemetodista/b/bucket-20200521-1254/o/ords.war"
}

# Optional: required only for using Tomcat
variable "URL_tomcat_file" {
  default = "https://objectstorage.eu-frankfurt-1.oraclecloud.com/n/oraclemetodista/b/bucket-20200521-1254/o/apache-tomcat-8.5.55.tar.gz"
}

# Optional: required only when configuring APEX
variable "URL_APEX_file" {
  default = "https://objectstorage.eu-frankfurt-1.oraclecloud.com/n/oraclemetodista/b/bucket-20200521-1254/o/apex_20.1_en.zip"
}

variable "HostUserName" {
  default = "opc"
}

variable "BootStrapFile" {
  default = "./userdata/bootstrap.sh"
}

# Choose an Availability Domain
variable "AD" {
  default = "1"
}

# Web Server Flag:
#    0 => Jetty in ORDS 
#    1 => Apach Tomcat
variable "web_srv" {
  default = "1"
}

# FQDN Access Flag:
#    0 => FQDN access w/ CA cert SSL enabled (ZoneName required)
#    1 => IP address access
#variable "Secure_FQDN_access" {
#  default = "1"
#}

### Compute ####
variable "ComputeDisplayName" {
  default = "ORDS-Compute"
}

variable "InstanceName" {
  default = "ords-comp" // hostname
}

variable "InstanceShape" {
  default = "VM.Standard2.1"
}

variable "InstanceOS" {
  default = "Oracle Linux"
}

variable "InstanceOSVersion" {
  default = "7.8"
}

# APEX Install Mode Flag:
# Optional: required only when configuring APEX
#    0 => Full Development mode
#    1 => Runtime mode
variable "APEX_install_mode" {
  default = "0"
}
