Vagrant.configure("2") do |config|
  # use precise
  config.vm.box = "precise64"

  # enable puppet
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
  end

  config.vm.network :forwarded_port, guest: 80, host: 8880

  config.vm.provision :shell, :inline => "echo \"Asia/Singapore\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
end
