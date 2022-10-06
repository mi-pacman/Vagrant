#!/bin/bash
set -x

sudo apt update


####################
#MOTD_CUSTOMIZATION#
sudo cp /vagrant/scripts/update_motd.sh /usr/bin/update_motd.sh  # Copy MOTD script to machine
sudo chmod 775 /usr/bin/update_motd.sh  # Set permissions on MOTD script
sudo sed -i 's;session    optional     pam_motd.so  motd=/etd/motd;#session    optional     pam_motd.so  motd=/etc/motd;g' /etc/pam.d/sshd  # Set PAM to execute script upon each new session
sudo sed -i 's;session    optional     pam_motd.so noupdate;#session    optional     pam_motd.so noupdate;g' /etc/pam.d/sshd  # Prevent MOTD from showing twice
sudo sed -i 's;session    optional     pam_motd.so  motd=/run/motd.dynamic;#session    optional     pam_motd.so  motd=/run/motd.dynamic;g' /etc/pam.d/sshd  # Prevent MOTD from showing twice
printf 'session   optional   pam_exec.so   stdout /usr/bin/update_motd.sh\nsession   optional   pam_motd.so   motd=/etc/motd' | sudo tee -a /etc/pam.d/sshd  # Set PAM to execute script upon each new session


###################
#VIM_CONFIGURATION#
sudo git clone --depth=1 https://github.com/amix/vimrc.git /opt/vim_runtime
sudo git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sudo sh ~/.vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime --all


##################
#ZSH_CONGIRUATION#
sudo apt install -y zsh  # Download Zsh
sudo git clone https://github.com/ohmyzsh/ohmyzsh.git /home/vagrant/.oh-my-zsh  # Clone zsh config repo
sudo cp /vagrant/configs/zshrc /home/vagrant/.zshrc  # Copy over template .zshrc file
sudo usermod --shell /bin/zsh vagrant # Change user $USERs default shell
sudo chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh /home/vagrant/.zshrc


##########################
#VIRTUALBOX_CONFIGURATION#
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list


#################
#HASHICORP_TOOLS#
sudo wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
#sudo apt install -y vagrant packer terraform

#############
#OTHER_TOOLS#
sudo apt update
sudo apt install -y git vim tmux htop net-tools


#Only uncomment this last line if your willing to download over 500GB of programs
#sudo apt install -y virtualbox-6.1 vagrant packer
