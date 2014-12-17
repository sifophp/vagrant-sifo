# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos7_minimal"
  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.

  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.hostname = "app.sifo.local"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.

  config.vm.synced_folder "./shared/www", "/www"
  config.vm.synced_folder "./shared/logs", "/logs"
  config.vm.provision :shell, :path => "./shell/install.sh"

  # You need the librarian_puppet plugin.
  # Run from the command line: vagrant plugin install vagrant-librarian-puppet
  config.librarian_puppet.puppetfile_dir = "puppet"
  


  # Configure VM to use host DNS to resolve hostnames.
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.provision :puppet,
    :options => ["--fileserverconfig=fileserver.conf"],
    :facter => { "fqdn" => "vagrant.vagrantup.com" }  do |puppet|
       puppet.manifests_path = "puppet/manifests"
       puppet.working_directory = "/etc/puppet/"
       puppet.manifest_file = "site.pp"
       puppet.hiera_config_path = "puppet/manifests/hiera.yaml"
  end

end
