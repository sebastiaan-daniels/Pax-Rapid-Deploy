# -*- mode: ruby -*-
# vi: set ft=ruby :

$timeout_script = <<-'SCRIPT'
sudo systemctl disable systemd-networkd-wait-online.service
systemctl mask systemd-networkd-wait-online.service
SCRIPT

$docker_install = <<-'SCRIPT'
wget -O docker.sh https://get.docker.com/
bash docker.sh
sudo usermod -aG docker vagrant
newgrp docker # load the new group permissions in
SCRIPT

$git_install = <<-'SCRIPT'
sudo apt-get update
sudo apt-get install -y git
SCRIPT

$python_install = <<-'SCRIPT'
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.11
sudo apt-get install python3.11-venv
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.network "forwarded_port", guest: 8085, host: 8085
    config.vm.network "forwarded_port", guest: 443, host: 443
    config.vm.network "private_network", ip: "192.168.56.5"
    config.vm.hostname = "Pax"
    config.vm.provision "shell", inline: $timeout_script
    config.vm.provision "shell", inline: $docker_install
    config.vm.provision "shell", inline: $git_install
    config.vm.provision "shell", inline: $python_install
    config.vm.synced_folder "./var", "/home/vagrant/Pax-var"
    config.vm.provision "shell", path: "config.sh"
    config.vm.box = "generic/ubuntu2204"
    config.vm.define :pax

end