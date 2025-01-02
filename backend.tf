# (Terraform version >= 1.6.4)
terraform {
  backend "s3" {
    bucket                      = "oci-poc-tfstate"
    region                      = "ap-tokyo-1"
    key                         = "poc/tf.tfstate"
    profile                     = "oci"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    use_path_style              = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
    endpoints = {
      s3 = "https://nrewurwcjgbm.compat.objectstorage.ap-tokyo-1.oraclecloud.com"
    }
  }
}
