module "vcn" {
  source = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"
  
  compartment_id = var.compartment_id
  region = var.region

  nat_gateway_route_rules = null #todo

  vcn_name = "oci-tf-vcn"
  vcn_cidrs = [var.vcn_cidr]


  
  # internet gateway
  create_internet_gateway = true
  internet_gateway_display_name = "oci-tf-IG"
  internet_gateway_route_rules = null #todo

  # nat gateway
  create_nat_gateway = true

  # service gateway (多分AWSでいう VPCエンドポイント)
  create_service_gateway = false

  # local peering gateway(AWSでいう vpc peering設定)
  local_peering_gateways = null



}