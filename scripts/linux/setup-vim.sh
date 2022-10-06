#!/bin/bash

sudo git clone --depth=1 https://github.com/amix/vimrc.git /opt/vim_runtime
sudo git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sudo sh ~/.vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime --all
