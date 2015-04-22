#
# Cookbook Name:: users
# Recipe:: default
#

home_dir = "/Users/#{node['user']}"
# Creating ".ssh" directory
directory "#{home_dir}/.ssh" do
  owner node['user']
  mode "0700"
end

template "#{home_dir}/.ssh/authorized_keys"  do
  source "authorized_keys.erb"
  owner node['user']
  mode "0600"
  variables :ssh_keys => node['ssh_keys']
end