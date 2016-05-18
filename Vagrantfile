Vagrant.configure(2) do |config|


    config.vm.box = "ubuntu/trusty64"
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
      v.memory = 8000
      v.cpus = 2
    end

    config.vm.network :forwarded_port, host: 8031, guest: 80 # Apache
    config.vm.network :forwarded_port, host: 8038, guest: 8080 # ElasticSearch


    config.vm.provision "ansible" do |ansible| 
        ansible.playbook = "provision/playbook.yml"
    end
end

