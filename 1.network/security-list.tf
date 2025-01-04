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
    tcp_options {
      min = 22
      max = 22
    }
    stateless = false
  }

  ingress_security_rules { 
      stateless = false
      source = "10.0.0.0/16"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      tcp_options { 
          min = 22
          max = 22
      }
    }


  #### TODO: これが必要かわからないので、コメントアウト。
  # ingress_security_rules { 
  #     stateless = false
  #     source = "0.0.0.0/0"
  #     source_type = "CIDR_BLOCK"
  #     # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
  #     protocol = "1"
  
  #     # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
  #     icmp_options {
  #       type = 3
  #       code = 4
  #     } 
  #   }   

  #### TODO: これが必要かわからないので、コメントアウト。

  # ingress_security_rules { 
  #   stateless = false
  #   source = "10.0.0.0/16"
  #   source_type = "CIDR_BLOCK"
  #   # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
  #   protocol = "1"

  #   # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
  #   icmp_options {
  #     type = 3
  #   } 
  # }

  egress_security_rules {
    stateless = false
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol = "all"
    
  }
}




resource "oci_core_security_list" "public-security-list"{

  compartment_id = var.compartment_id
  vcn_id = module.vcn.vcn_id
  display_name = "security-list-for-oci-tf-public"

  ingress_security_rules {
    description = "ingress this vpn all"
    source = var.vcn_cidr
    source_type = "CIDR_BLOCK"
    protocol = "6"
    stateless = false
  }

  # 任意のIPからのTCPリクエストを許可。※ここは本来CDNだけにしたい。
  ingress_security_rules {
    stateless = false
    source = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol = "6"
    tcp_options {
      min = 22
      max = 22
    }
  }

  #### TODO: これが必要かわからないので、コメントアウト。

  # ingress_security_rules { 
  #     stateless = false
  #     source = "0.0.0.0/0"
  #     source_type = "CIDR_BLOCK"
  #     # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
  #     protocol = "1"

  #     # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
  #     icmp_options {
  #       type = 3
  #       code = 4
  #     } 
  #   }   
  
  #### TODO: これが必要かわからないので、コメントアウト。
  # ingress_security_rules { 
  #   stateless = false
  #   source = "10.0.0.0/16"
  #   source_type = "CIDR_BLOCK"
  #   # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
  #   protocol = "1"

  #   # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
  #   icmp_options {
  #     type = 3
  #   } 
  # }

  egress_security_rules {
    stateless = false
    destination = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol = "all"
    
  }
}


