provider "skytap" {
  username = "${var.username}"
  api_token = "${var.api_token}"
}

resource "skytap_environment" "env"{
  template_id = "1863063"
  name = "Prueba"
  description = "Skytap terraform provider example environment."
}
resource "skytap_environment" "env2"{
  template_id = "1863063"
  name = "Prueba2"
  description = "Skytap terraform provider example environment."
}
resource "skytap_project" "project" {
  name = "Terraform Example"
  summary = "Skytap terraform provider example project."
  show_project_members = false
  auto_add_role_name = "participant"
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

