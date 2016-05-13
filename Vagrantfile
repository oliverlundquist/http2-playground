box_name     = "http2-playground"
chef_version = "12.5.1"
box_ip       = "192.168.100.120"
command      = ARGV[0]
run_list     = [
  "provision::provision"
]

Vagrant.configure("2") do |c|
  c.vm.box = "ubuntu/trusty64"
  c.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/20160503/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  #c.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/1/providers/virtualbox.box"
  #c.vm.hostname = box_name
  if command == "ssh"
    c.ssh.username = "ubuntu"
    c.ssh.host = box_ip
    c.ssh.port = 22
  end
  c.ssh.insert_key = false
  c.vm.network(:forwarded_port, { :guest => 22, :host => 8888, :auto_correct => false, :id => "ssh" })
  c.vm.network(:private_network, { :ip => box_ip })
  c.vm.synced_folder ".", "/vagrant", disabled: true
  c.omnibus.chef_version = chef_version
  c.vm.provision "chef_zero" do |chef|
    chef.nodes_path = "cookbooks"
    chef.cookbooks_path = "cookbooks"
    chef.json = { :environment => 'development' }
    run_list.each do |recipe|
      chef.add_recipe recipe
    end
  end
  c.vm.provider :virtualbox do |p|
    p.customize ["modifyvm", :id, "--memory", "1024"]
    p.customize ["modifyvm", :id, "--cpus", "1"]
    p.customize ["modifyvm", :id, "--pae", "on"]
    p.customize ["modifyvm", :id, "--nestedpaging", "on"]
    p.customize ["modifyvm", :id, "--hwvirtex", "on"]
    p.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    p.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    p.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
  end
end
