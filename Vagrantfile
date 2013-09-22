Vagrant.configure("2") do |config|
  # use precise
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # enable puppet
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "init.pp"
    puppet.options = ['--verbose']
  end

  config.vm.network :forwarded_port, guest: 80, host: 8880

  config.vm.provision :shell, :inline => "echo \"Asia/Singapore\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
end
