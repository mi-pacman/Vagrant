#!/bin/bash

sudo cp /vagrant/files/update_motd.sh /usr/bin/update_motd.sh  # Copy MOTD script to machine
sudo chmod 775 /usr/bin/update_motd.sh  # Set permissions on MOTD script
sudo sed -i 's;session    optional     pam_motd.so  motd=/etd/motd;#session    optional     pam_motd.so  motd=/etc/motd;g' /etc/pam.d/sshd  # Set PAM to execute script upon each new session
sudo sed -i 's;session    optional     pam_motd.so noupdate;#session    optional     pam_motd.so noupdate;g' /etc/pam.d/sshd  # Prevent MOTD from showing twice
sudo sed -i 's;session    optional     pam_motd.so  motd=/run/motd.dynamic;#session    optional     pam_motd.so  motd=/run/motd.dynamic;g' /etc/pam.d/sshd  # Prevent MOTD from showing twice
printf 'session   optional   pam_exec.so   stdout /usr/bin/update_motd.sh\nsession   optional   pam_motd.so   motd=/etc/motd' | sudo tee -a /etc/pam.d/sshd  # Set PAM to execute script upon each new session
