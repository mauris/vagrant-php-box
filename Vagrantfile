Vagrant.configure("2") do |config|

  config.vm.define "web" do |webconfig|
    # use precise
    webconfig.vm.box = "precise64"
    webconfig.vm.box_url = "http://files.vagrantup.com/precise64.box"

    webconfig.vm.network "private_network", ip: "192.168.50.4"
    webconfig.vm.network :forwarded_port, guest: 80, host: 8880

    if File.exist?("vagrant.sh")
      webconfig.vm.provision :shell, :path => "vagrant.sh"
    end

    webconfig.vm.provision :shell, :inline => "sudo apt-get update && sudo apt-get install puppet -y"

    # enable puppet
    webconfig.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file  = "init.pp"
      puppet.options = ['--verbose']
    end
  end

  config.vm.define "db" do |dbconfig|
    dbconfig.vm.box = "precise64"
    dbconfig.vm.network :forwarded_port, guest: 3306, host: 13306
    dbconfig.vm.network "private_network", ip: "192.168.50.5"

    dbconfig.vm.provision :shell, :inline => "sudo apt-get update && sudo apt-get install puppet -y"

    dbconfig.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file  = "db.pp"
      puppet.options = ['--verbose']
    end
  end
  
end
