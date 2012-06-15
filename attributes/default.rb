# CF Install folder
default['cf9']['install_path'] = "/opt/coldfusion9"
# CF Admin password
default['cf9']['admin_pw'] = "vagrant"
# JRun Web root
default['cf9']['webroot'] = "/vagrant/wwwroot"
# Node Datasources
default['cf9']['datasources'] = {}
# Node Mappings
default['cf9']['mappings'] = {}
# Keystore Password
default['cf9']['ssl_keystore_pass'] = "cf9keys"
# SSL Hostname
default['cf9']['ssl_hostname'] = "33.33.33.33"
# SSL Cert Attributes
default['cf9']['ssl_company'] = "ColdFuison"
default['cf9']['ssl_country'] = "US"
default['cf9']['ssl_state'] = "Pennsylvania"
default['cf9']['ssl_locality'] = "Philadelphia"
default['cf9']['ssl_ou'] = "ColdFusion"
default['cf9']['ssl_email'] = "coldfusion9@example.com"
# JVM
default['cf9']['java_home'] = "#{node['cf9']['install_path']}/runtime" 
# Trusted Certificates
default['cf9']['trustedcerts'] = {}
# Firewall settings
default['cf9']['firewall']['ssl_port'] = "443"
default['cf9']['firewall']['http_port'] = "80"
# CF Admin Settings
default['cf9']['admin']['server_setting']['caching']['inRequestTemplateCacheEnabled'] = "false"
default['cf9']['admin']['server_setting']['caching']['templateCacheSize'] = "1024.0"
default['cf9']['admin']['server_setting']['caching']['componentCacheEnabled'] = "false"
default['cf9']['admin']['server_setting']['caching']['trustedCacheEnabled'] = "false"
default['cf9']['admin']['server_setting']['caching']['saveClassFiles'] = "false"
# Download Locations
# Note: No public download for CF 9 installer, you may need to download from Adobe and place in the cookbook files folder.
# default['cf9']['standalone']['9-installer']['url'] = ""
default['cf9']['standalone']['901-installer']['url'] = "http://download.macromedia.com/pub/coldfusion/updates/901/ColdFusion_update_901_WWEJ_linux.bin"
default['cf9']['chf9010002']['CF901']['url'] = "http://kb2.adobe.com/cps/918/cpsid_91836/attachments/CF901.zip"
default['cf9']['chf9010002']['CFIDE-901']['url'] = "http://kb2.adobe.com/cps/918/cpsid_91836/attachments/CFIDE-901.zip"
default['cf9']['hf900100003']['CF901jar']['url'] = "http://kb2.adobe.com/cps/925/cpsid_92512/attachments/CF901jar.zip"

