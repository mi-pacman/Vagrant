Vagrant.configure("2") do |config|
   config.vm.define "win16" do |win16|
     win16.vm.box = "gusztavvargadr/windows-server-2019-standard"
     win16.vm.network "private_network", ip: "10.0.0.15", virtualbox__intnet: true 
     win16.vm.hostname = "MCDC01"
     win16.vm.provision "shell", path: "scripts/windows/generic-setup.ps1"
     win16.vm.provision "shell", path: "scripts/windows/DC/ADDS-install.ps1"
     win16.vm.provision "file", source: "files", destination: "/tmp/files"
     win16.vm.provision "file", source: "scripts", destination: "/tmp/scripts"
     win16.vm.provider "virtualbox" do |vb|
       vb.gui = true
       vb.memory = 8192 
       vb.cpus = 4
     end
   end

   config.vm.define "deb11" do |deb11|
     deb11.vm.box = "generic/debian11"
     deb11.vm.network "private_network", ip: "10.0.0.20", virtualbox__intnet: true 
     deb11.vm.hostname = "MCWS10"
     deb11.vm.synced_folder "./", "/vagrant"
     deb11.vm.provision "shell", path: "scripts/linux/setup-motd.sh"
     deb11.vm.provision "shell", path: "scripts/linux/setup-vim.sh"
     deb11.vm.provision "shell", path: "scripts/linux/setup-zsh.sh"
     deb11.vm.provision "shell", path: "scripts/linux/setup-powershell.sh"
     deb11.vm.provider "virtualbox" do |vb|
       vb.memory = 4096 
       vb.cpus = 2
     end
   end
end
