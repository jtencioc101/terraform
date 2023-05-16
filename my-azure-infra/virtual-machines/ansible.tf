resource "ansible_host" "my_ansible_host" {
  name = var.computer_name
}

resource "ansible_playbook" "playbook" {
  playbook = "playbook.yml"
  name     = var.computer_name
}