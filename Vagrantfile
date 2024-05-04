Vagrant.configure("2") do |config|

  config.vm.box = "generic/ubuntu2204"


  (1..4).each do |number|
    config.vm.define "m#{number}" do |node|
      node.vm.hostname = "m#{number}"
      # need this for sshing into vm machines.
      node.vm.network 'private_network', ip: "192.168.99.20#{number}"
      node.vm.network 'forwarded_port', id: 'ssh', host: "820#{number}", guest: "22"
    end
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '1024'
    vb.cpus = 1
  end

end
