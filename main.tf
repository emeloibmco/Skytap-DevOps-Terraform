provider "skytap" {
  username = "${var.username}"
  api_token = "${var.api_token}"
}

resource "skytap_environment" "env"{
  template_id = "1478915"
  name = "Ubuntu 18.04 LTS"
  description = "Maquina Ubuntu."
}
resource "skytap_environment" "env2"{
  template_id = "1498899"
  name = "AIX 7.2"
  description = "Maquina Power AIX 7.2."
}

data "skytap_template" "example" {
    name = "18.04"
    most_recent = true
}

resource "skytap_network" "network" {
  environment_id = "${skytap_environment.env.id}"
  name = "net"
  domain = "iscsi"
  subnet = "10.0.100.0/24"
  gateway = "10.0.100.254"
  tunnelable = true
}
resource "skytap_network" "network1" {
  environment_id = "${skytap_environment.env2.id}"
  name = "net2"
  domain = "iscsi"
  subnet = "10.0.200.0/24"
  gateway = "10.0.200.254"
  tunnelable = true
}

