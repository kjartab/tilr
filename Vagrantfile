Vagrant.configure(2) do |config|


    config.vm.box = "ubuntu/trusty64"

    config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end

    config.vm.network :forwarded_port, host: 8031, guest: 80 # Apache
    config.vm.network :forwarded_port, host: 8038, guest: 8080 # ElasticSearch

end

