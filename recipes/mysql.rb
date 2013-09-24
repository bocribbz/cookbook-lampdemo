include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "database::mysql"

# Set DB Connection Properties
DB_CONNECTION = {
  :host     => "localhost",
  :username => 'root',
  :password => node["mysql"]["server_root_password"]
}

# Create database
mysql_database node["lampdemo"]["db"]["name"] do
  connection DB_CONNECTION
  action :create
end

# Create DB user
mysql_database_user node["lampdemo"]["db"]["user"] do
  connection DB_CONNECTION
  password node["lampdemo"]["db"]["pass"]
  action :create
end

# Grant Priveleges
mysql_database_user node["lampdemo"]["db"]["user"] do
  connection DB_CONNECTION
  password node["lampdemo"]["db"]["pass"]
  database_name node["lampdemo"]["db"]["name"]
  privileges [:all]
  action :grant
end

