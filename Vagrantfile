Vagrant.configure("2") do |config|

  config.vm.define "web" do |webconfig|
    # use precise
    webconfig.vm.box = "precise64"
    webconfig.vm.box_url = "http://files.vagrantup.com/precise64.box"

    webconfig.vm.hostname = "website.dev"
    webconfig.vm.network :forwarded_port, guest: 80, host: 8880

    webconfig.vm.provision :shell, :inline => "echo \"Asia/Singapore\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

    if File.exist?("vagrant.sh")
      webconfig.vm.provision :shell, :path => "vagrant.sh"
    end

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
    dbconfig.vm.network :forwarded_port, guest: 80, host: 8080

    dbconfig.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path = "puppet/modules"
      puppet.manifest_file  = "db.pp"
      puppet.options = ['--verbose']
    end
  end
  
end
