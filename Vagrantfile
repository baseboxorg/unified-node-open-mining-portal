# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = ENV["BOX_NAME"] || "bento/ubuntu-14.04"
BOX_MEMORY = ENV["BOX_MEMORY"] || "1024"
POOL_DOMAIN = ENV["POOL_DOMAIN"] || "pool.me"
POOL_IP = ENV["POOL_IP"] || "10.1.10.1"

Vagrant::configure("2") do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI
  config.vm.synced_folder File.dirname(__FILE__), "/srv/pool-me"
  config.vm.synced_folder "./data", "/home/vagrant"
  config.vm.network "forwarded_port", guest: 9333, host: 9333,  auto_correct: true
  config.vm.network "forwarded_port", guest: 9332, host: 9332,  auto_correct: true
  
  config.vm.hostname = "#{POOL_DOMAIN}"
  config.vm.network :private_network, ip: POOL_IP

  config.vm.provider "vmware_fusion" do |v|
    #v.gui = true
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  # Configure docker apt sources
  config.vm.provision :shell, :inline => "apt-get update -qq"
  config.vm.provision :shell, :inline => "apt-get install -y curl apt-transport-https git"
  config.vm.provision :shell, :inline => "curl https://repogen.simplylinux.ch/txt/trusty/sources_47ce9f463a8d4fc9a61e3ed3bbc186d14ae69cd7.txt | tee /etc/apt/sources.lis"
  config.vm.provision :shell, :inline => "apt-get update -qq"
  config.vm.provision :shell, :inline => "apt-get dist-upgrade -qqy"

  # Install pool-alt
  #config.vm.provision :shell, :inline => "cd /srv/pool-alt && make install && make devinstall"
end
