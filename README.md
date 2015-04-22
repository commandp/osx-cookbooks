# osx-cookbooks

A chef repository for automating the configuration of MAC OS X workstations for rails

## Usage


### 1. setting <YOUR USERNAME> run sudo command with no password

    $ sudo visudo
    commandp ALL=(ALL) NOPASSWD: ALL

### 2.Install Command Line Tools

    $ xcode-select --install

### 3.Setting & Installing chef

    $ curl -fsSL https://raw.githubusercontent.com/commandp/osx-cookbooks/master/script/bootstrap.sh | sudo bash

### 4.Clone cookbook & Running deploy

    $ git clone https://github.com/commandp/osx-cookbooks.git ~/osx-cookbooks ; cd ~/osx-cookbooks/

### 5.change rails_dev.json user attribute

      "user": "<YOUR USERNAME>"

### 5.Deploy

    $ ./script/deploy.sh


include

  * Git
  * RVM
  * Ruby 2.1.2 , 2.2.2
  * Postgresql
  * Imagemagick
  * Alfred
  * Macdown
  * 1Password
  * Dash
  * iterm2
  * sublime-text3
  * google-chrome
  * tunnelblick
---

## cookbook

### If Berksfile Change

    $ berks vendor vendor/cookbooks

### Run customized your node

Now you are almost ready to run chef solo. Before running chef-solo you should copy the `rolos/rails_dev.json` to `YOUR_NAME.json` and edit it to your liking.

    $ chef-solo -c solo.rb -j rolos/YOUR_NAME.json

