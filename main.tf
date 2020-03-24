module "hub-vcn-module" {
  source                                 = "./modules/hub_vcn"
  compartment_ocid                       = "${var.compartment_ocid}"
  hub-vcn-cidr                           = "${var.hub-vcn-cidr}"
  hub-vcn-display-name                   = "${var.hub-vcn-display-name}"
  hub-vcn-dns-label                      = "${var.hub-vcn-dns-label}"
  hub-route-table-display-name           = "${var.hub-route-table-display-name}"
  hub-vcn-default-dhcp-display-name      = "${var.hub-vcn-default-dhcp-display-name}"
  hub-default-security-list-display-name = "${var.hub-default-security-list-display-name}"
}
