Vagrant.configure("2") do |config|


  config.vm.box = 'ubuntu/jammy64'
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  config.vm.define "m1" do |master|
    master.vm.hostname = "m1"
    master.vm.network 'private_network', ip: "192.168.99.201"
    master.vm.network 'forwarded_port', id: 'ssh', host: "8201", guest: "22"
    master.vm.provider "virtualbox" do |v|
      #v.gui = true
      v.name = "m1"
      v.memory = 2024
      v.cpus = 2
    end
  end


  (1..2).each do |number|
    config.vm.define "w#{number}" do |node|
      node.vm.hostname = "w#{number}"
      node.vm.boot_timeout = 300
      # need this for sshing into vm machines.
      node.vm.network 'private_network', ip: "192.168.99.21#{number}"
      node.vm.network 'forwarded_port', id: 'ssh', host: "821#{number}", guest: "22"
      node.vm.provider 'virtualbox' do |vb|
        #vb.gui = true
        vb.name = "w#{number}"
        vb.memory = 2024
        vb.cpus = 2
      end
    end
  end

  
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get install -y net-tools
    sudo apt-get install -y jq
  SHELL

end
