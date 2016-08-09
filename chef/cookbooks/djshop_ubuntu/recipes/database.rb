#
# Cookbook Name:: .
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



# puts "HELLO -------------- "+ENV['USER']


# log 'message' do
#   message 'Hello world'+ENV['USER']
#   level :info
# end

# bash "echo something."+ENV['USERNAME']+":"+ENV['USER'] do
#    code <<-EOF
#      echo 'I am a chef!'+ENV['USERNAME']
#    EOF
# end


# user 'mysql' do
#   action :create
# end


# # Configure the MySQL client
# mysql_client 'default' do
#   action :create
#   version '5.6'
#   package_version ''
#   run_user 'mysql'
#   run_group 'mysql'
# end


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

mysql_client 'default' do
  action :create
  version '5.6'
end

mysql_service 'default' do
  version '5.6'
  initial_root_password mysql_config["password"]
  action [:create, :start]
end
