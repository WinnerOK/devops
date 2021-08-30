terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.1-alpha.1"
    }
  }
}

resource "virtualbox_vm" "node" {
  count     = 1
  name      = "node-01"
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
}
