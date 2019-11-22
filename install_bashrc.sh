#!/bin/sh
set -e

if [[ -z "${ENV_CONFIG}" ]]; then
  export ENV_CONFIG=$HOME
fi

echo 'source $ENV_CONFIG/.bash_config/bashrcs/bashrc.sh
source $ENV_CONFIG/.bash_config/bashrcs/bashrc_prj.sh
source $ENV_CONFIG/.bash_config/bashrcs/bash_alias.sh
source $ENV_CONFIG/.bash_config/bashrcs/bash_alias_prj.sh' >> ~/.bashrc

echo "Installed the BASH configuration successfully!"
