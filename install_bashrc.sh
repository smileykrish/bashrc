#!/bin/sh
set -e

if [[ -z "${ENV_CONFIG}" ]]; then
  export ENV_CONFIG=$HOME
fi

echo 'export ENV_CONFIG=$HOME
export BASH_CONFIG=$ENV_CONFIG/.bash_config
source $ENV_CONFIG/.bash_config/bashrcs/bashrc.sh
source $ENV_CONFIG/.bash_config/bashrcs/bash_alias.sh
source $ENV_CONFIG/.bash_config/project/bashrcs/bashrc.sh
source $ENV_CONFIG/.bash_config/project/bashrcs/bash_alias.sh' >> $HOME/.bashrc

echo "Installed the BASH configuration successfully!"
