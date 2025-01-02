# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "private-security-list"{

  compartment_id = var.compartment_id
  vcn_id = module.vcn.vcn_id
  display_name = "security-list-for-oci-tf-private"

  ingress_security_rules {
    description = "ingress this vpn all"
    source = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol = "6"
    stateless = false
  }

  egress_security_rules {
    stateless = false
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol = "all"
    
  }
}



