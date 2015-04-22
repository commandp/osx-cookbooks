#
# Cookbook Name:: ruby
# Recipe:: default
#

RVM_COMMAND = "/Users/#{node[:user]}/.rvm/bin/rvm"

execute "Installs RVM (Ruby Version Manager)" do
 user node[:user]
 command "curl -sSL https://get.rvm.io | bash"
 not_if "which #{RVM_COMMAND}"
end


node['rvm']['rubies']['version'].each do |version|
execute "Install #{version}" do
  user node[:user]
  command "#{RVM_COMMAND} install #{version}"
  not_if "#{RVM_COMMAND} list | grep '#{version}'"
end
end

execute "Set Default Ruby Version" do
  user node[:user]
  command "#{RVM_COMMAND} use #{node['rvm']['ruby']['default_version']} --default"
  not_if "#{RVM_COMMAND} list | grep '=> #{node['rvm']['ruby']['default_version']}'"
end
