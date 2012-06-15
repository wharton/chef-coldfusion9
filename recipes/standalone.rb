#
# Cookbook Name:: coldfuison9
# Recipe:: standalone
#
# Copyright 2011, Lew Goettner, Nathan Mische
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Create the CF 9 properties file
template "#{Chef::Config['file_cache_path']}/cf9-installer.properties" do
  source "cf9-installer.properties.erb"
  mode "0644"
  owner "root"
  group "root"
  not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9_InstallLog.log") }
end


if node['cf9']['standalone'] && node['cf9']['standalone']['9-installer']

  # Download CF 9
  remote_file "#{Chef::Config['file_cache_path']}/ColdFusion_9_WWE_linux.bin" do
    source "#{node['cf9']['standalone']['9-installer']['url']}"
    action :create_if_missing
    mode "0744"
    owner "root"
    group "root"
    not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9_InstallLog.log") }
  end

else

  # Move the CF 9 installer
  cookbook_file "#{Chef::Config['file_cache_path']}/ColdFusion_9_WWE_linux.bin" do
    source "ColdFusion_9_WWE_linux.bin"
    mode "0744"
    owner "root"
    group "root"
    not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9_InstallLog.log") }
  end

end

# Run the CF 9 installer
execute "cf9_installer" do
  command "#{Chef::Config['file_cache_path']}/ColdFusion_9_WWE_linux.bin -f #{Chef::Config['file_cache_path']}/cf9-installer.properties"
  creates "#{node['cf9']['install_path']}/Adobe_ColdFusion_9_InstallLog.log"
  action :run
  user "root"
  cwd "#{Chef::Config['file_cache_path']}"
end

# Link the init script
link "/etc/init.d/coldfusion" do
  to "#{node['cf9']['install_path']}/bin/coldfusion"
end

# Set up CF as a service for CF 9.0.1 installation
service "coldfusion" do  
  supports :restart => true
  action :enable
end

# Stop CF
execute "/bin/true" do
  not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9.0.1_InstallLog.log") }
  notifies :stop, "service[coldfusion]", :immediately
end

# Create the CF 9.0.1 installer input file - hack to workaround silent installtion issues
template "#{Chef::Config['file_cache_path']}/cf901-installer.input" do
  source "cf901-installer.input.erb"
  mode "0644"
  owner "root"
  group "root"
  not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9.0.1_InstallLog.log") }
end


if node['cf9']['standalone'] && node['cf9']['standalone']['901-installer']

  # Download CF 9.0.1 (http://www.adobe.com/support/coldfusion/downloads_updates.html)
  remote_file "#{Chef::Config['file_cache_path']}/ColdFusion_update_901_WWEJ_linux.bin" do
    source "#{node['cf9']['standalone']['901-installer']['url']}"
    action :create_if_missing
    mode "0744"
    owner "root"
    group "root"
    not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9.0.1_InstallLog.log") }
  end

else

  # Move the CF 9.0.1 installer 
  cookbook_file "#{Chef::Config['file_cache_path']}/ColdFusion_update_901_WWEJ_linux.bin" do
    source "ColdFusion_update_901_WWEJ_linux.bin"
    mode "0744"
    owner "root"
    group "root"
  end

end 

# Run the CF 9.0.1 installer
execute "cf901_installer" do
  command "#{Chef::Config['file_cache_path']}/ColdFusion_update_901_WWEJ_linux.bin < #{Chef::Config['file_cache_path']}/cf901-installer.input"
  creates "#{node['cf9']['install_path']}/Adobe_ColdFusion_9.0.1_InstallLog.log"
  action :run
  user "root"
  cwd "#{Chef::Config['file_cache_path']}"
  notifies :restart, "service[coldfusion]", :delayed
end

# Create the webroot if it doesn't exist
directory "#{node['cf9']['webroot']}" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  action :create
  not_if { File.directory?("#{node['cf9']['webroot']}") }
end

# Set the webroot
template "#{node['cf9']['install_path']}/wwwroot/WEB-INF/jrun-web.xml" do
  source "jrun-web.xml.erb"
  mode "0664"
  owner "nobody"
  group "bin"
  notifies :restart, "service[coldfusion]", :delayed
end

# Start CF
execute "/bin/true" do
  not_if { File.exists?("#{node['cf9']['install_path']}/Adobe_ColdFusion_9.0.1_InstallLog.log") }
  notifies :start, "service[coldfusion]", :immediately
end

