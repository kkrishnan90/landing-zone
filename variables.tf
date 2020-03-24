variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}


# Hub VCN Details
variable "hub-vcn-cidr" {}

variable "hub-vcn-display-name" {
  default = "hub-vcn"
}

variable "hub-vcn-dns-label" {
  default = "hub-vcn-dns-label"
}

variable "hub-route-table-display-name" {
  default = "hub-route-table"
}

variable "hub-vcn-default-dhcp-display-name" {
  default = "hub-default-DHCP-options"
}

variable "hub-default-security-list-display-name" {
  default = "hub-default-security-list"
}
