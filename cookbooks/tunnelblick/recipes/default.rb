#
# Cookbook Name:: Tunnelblick
# Recipe:: default
#
# This's VPN app
#

include_recipe 'dmg'

dmg_package 'Tunnelblick' do
  source   node['tunnelblick']['source']
  checksum node['tunnelblick']['checksum']
  action   :install
  not_if { ::File.directory?("/Applications/Tunnelblick.app") }
end

