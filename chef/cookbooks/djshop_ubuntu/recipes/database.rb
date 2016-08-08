#
# Cookbook Name:: .
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# Configure the MySQL client
mysql_client 'default' do
  action :create
  version '5.6'
  package_version ''
  run_user 'mysql'
  run_group 'mysql'
end


mysql_config = data_bag_item("passwords", "mysql")

# Configure the MySQL service
mysql_service 'default' do
  version '5.6'
  package_version ''
  initial_root_password mysql_config["password"]
  action [:create, :start]
  run_user 'mysql'
  run_group 'mysql'
end


puts "HELLO --------------<"


log 'message' do
  message 'Hello world'+ENV['USER']
  level :info
end

bash "echo something" do
   code <<-EOF
     echo 'I am a chef!'+ENV['USERNAME']
   EOF
end
