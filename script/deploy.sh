#!/bin/bash
set -e

## Only run this script with root access
# if [[ $EUID -ne 0 ]]; then
#   echo "ERROR: Please run this script with sudo or as root" 1>&2
#   exit 1
# fi

echo "Strat chef-solo"
## Set relative paths
solo_path="solo.rb"
config_path="roles/rails_dev.json"

## Set command
cmd="chef-solo -c ${solo_path} -j ${config_path}"

## Run chef-solo command
echo $cmd
exec $cmd