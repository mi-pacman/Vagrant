#!/bin/bash

sudo apt update  # Update repositories
sudo apt install -y zsh  # Download Zsh
sudo git clone https://github.com/ohmyzsh/ohmyzsh.git /home/vagrant/.oh-my-zsh  # Clone zsh config repo
sudo cp /vagrant/files/zshrc /home/vagrant/.zshrc  # Copy over template .zshrc file
sudo usermod --shell /bin/zsh vagrant # Change user $USERs default shell
sudo chown -R vagrant:vagrant /home/vagrant/.oh-my-zsh /home/vagrant/.zshrc
