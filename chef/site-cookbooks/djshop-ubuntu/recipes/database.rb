#
# Cookbook Name:: .
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



mysql_config = data_bag_item("passwords", "mysql")

# # Configure the MySQL service
# mysql_service 'default' do
#   version '5.6'
#   package_version ''
#   initial_root_password mysql_config["password"]
#   action [:create, :start]
#   run_user 'mysql'
#   run_group 'mysql'
# end

# Install mysql client
mysql_client 'default' do
  action :create
  version '5.6'
end

# Install mysql server & configrate service
mysql_service 'default' do
  version '5.6'
  initial_root_password mysql_config["password"]
  action [:create, :start]
end

# Configrate
mysql_config 'configuration' do
  instance 'default'
  source 'mysql.cnf.erb'
  action :create
  notifies :restart, 'mysql_service[default]'
end

# Install mysql2 Ruby gem
mysql2_chef_gem 'default' do
  action :install
end

# Create database instance
mysql_database node['djshop_ubuntu']['database']['dbname'] do
  connection(
             :host => node['djshop_ubuntu']['database']['host'],
             :username => node['djshop_ubuntu']['database']['root_username'],
             :password => mysql_config["password"]
            )
  action :create
end

mysql_database_user node['djshop_ubuntu']['database']['admin_username'] do
  connection(
             :host => node['djshop_ubuntu']['database']['host'],
             :username => node['djshop_ubuntu']['database']['root_username'],
             :password => mysql_config["password"]
            )
  password mysql_config['password_admin']
  database_name node['djshop_ubuntu']['database']['dbname']
  host node['djshop_ubuntu']['database']['host']
  action [:create, :grant]
end
