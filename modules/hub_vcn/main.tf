# VCN comes with default route table, security list and DHCP options
resource "oci_core_vcn" "hub-vcn" {
  cidr_block     = "${var.hub-vcn-cidr}"
  dns_label      = "${var.hub-vcn-dns-label}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.hub-vcn-display-name}"
}

resource "oci_core_route_table" "hub-route" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.hub-vcn.id}"
  display_name   = "${var.hub-route-table-display-name}"
}

resource "oci_core_default_dhcp_options" "default_dhcp_options" {
  manage_default_resource_id = "${oci_core_vcn.hub-vcn.default_dhcp_options_id}"
  display_name               = "${var.hub-vcn-default-dhcp-display-name}"

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}


resource "oci_core_default_security_list" "default_security_list" {
  manage_default_resource_id = "${oci_core_vcn.hub-vcn.default_security_list_id}"
  display_name               = "defaultSecurityList"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow outbound udp traffic on a port range
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "17" // udp
    stateless   = true

    udp_options {
      min = 319
      max = 320
    }
  }

  // allow inbound ssh traffic
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
}
