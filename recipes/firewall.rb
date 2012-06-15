#
# Cookbook Name:: coldfusion9
# Recipe:: firewall
#
# Copyright 2011, Nathan Mische
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

package "iptables-persistent" do
  action :install
end

service "iptables-persistent" do	
	supports :restart => true
	action :nothing
end

# Customize the firewall rules config
template "/etc/iptables/rules.v4" do  
  if node[:platform_version] == "10.04"
  	path "/etc/iptables/rules"
  end 
  source "rules.erb"
  mode "0644"
  owner "root"
  group "root"
  notifies :restart, "service[iptables-persistent]"  
end
