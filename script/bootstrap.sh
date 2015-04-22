#!/bin/bash
set -e

# Function that tests if a command exists
command_exists() {
  command -v "$1" &> /dev/null ;
}

# Add /var/chef/ if it doesn't exist
if [ ! -d "/var/chef/" ]; then
  echo "Creating /var/chef/"
  sudo mkdir -p /var/chef && sudo chown -R `whoami`:staff /var/chef
else
  echo "Directory /var/chef already exists"
fi

if [ ! -d "/usr/local/" ]; then
  echo "Creating /usr/local/"
  sudo mkdir -p /usr/local && sudo chown -R `whoami`:staff /usr/local
else
  echo "Directory /usr/local already exists"
fi

# Install chef-solo command if it doesn't exist (using omnibus installer)
if command_exists chef-solo; then
  echo "Chef already installed"
else
  echo "Installing chef 12.1.2 to: /opt/chef/"
  curl https://www.chef.io/chef/install.sh -o /tmp/chef-install.sh && chmod 755 /tmp/chef-install.sh && sudo /tmp/chef-install.sh -v 12.1.2 && rm /tmp/chef-install.sh
  echo ""
fi