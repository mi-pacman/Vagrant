#!/bin/bash

sudo apt update  && sudo apt install -y curl gnupg apt-transport-https  # Install system components

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -  # Import the public repository GPG keys

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'  # Register the Microsoft Product feed

sudo apt update && sudo apt install -y powershell  # Install PowerShell
