Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.provision :shell, :path => "vm_provision/provision-ubuntu-14.04.sh"
  config.vm.network "private_network", ip: "10.0.0.10"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50", "--cpus", "1"]
    vb.memory = 1024
  end
end