# Install PHP
include_recipe "php::default"

# Install PHP MySQL Package
package "php5-mysql" do
  action :install
  notifies :restart, resources("service[apache2]"), :delayed
end

# Create a PHP info page
file ::File.join(node["lampdemo"]["apache"]["docroot"], "index.php") do
  content "<?php phpinfo(); ?>"
end
