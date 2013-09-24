# Install PHP
include_recipe "php::default"

# Create a PHP info page
file ::File.join(node["lampdemo"]["apache"]["docroot"], "index.php") do
  content "<?php phpinfo(); ?>"
end
