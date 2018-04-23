#!/bin/sh
set -e

cd ~/.bash_config

echo 'source $HOME/.bash_config/bashrcs/bashrc.sh
source $HOME/.bash_config/bashrcs/bashrc_prj.sh
source $HOME/.bash_config/bashrcs/bash_alias.sh
source $HOME/.bash_config/bashrcs/bash_alias_prj.sh' >> ~/.bashrc

echo "Installed the BASH configuration successfully!"
