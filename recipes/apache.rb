# Activate modules (a2enmod) 
include_recipe "apache2::default"
include_recipe "apache2::mod_rewrite"

node.set["apache"]["default_site_enabled"] = false

directory node['lampdemo']['apache']['docroot'] do
  action :create
  recursive true
  mode 0755
  owner "root"
  group "root"
  not_if { ::File.exists?(node['lampdemo']['apache']['docroot']) }
end

# If not set, will output message on restart:
# Could not reliably determine the server's fully qualified 
# domain name, using 127.0.1.1 for ServerName
bash "Set ServerName" do
  code <<-EOH
    echo "ServerName #{node['lampdemo']['apache']['server_name']}" > /etc/apache2/conf.d/name
  EOH
  user "root"
end

web_app node["lampdemo"]["apache"]["app_name"] do
  server_name       node["lampdemo"]["apache"]["server_name"]
  server_aliases    node["lampdemo"]["apache"]["server_aliases"]
  template			"apache2/lampdemo.conf.erb"
  docroot           node["lampdemo"]["apache"]["docroot"]
  #log_dir           node["lampdemo"]["apache"]["docroot"], 'shared', 'logs')
  allow_override    'All'
end

