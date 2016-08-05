#
# Cookbook Name:: .
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# Configure the MySQL client
mysql_client 'default' do
  action :create
end


mysql_config = data_bag_item("passwords", "mysql", IO.read("/etc/chef/data_bag_key"))

# Configure the MySQL service
mysql_service 'default' do
  initial_root_password mysql_config["password"]
  action [:create, :start]
end
