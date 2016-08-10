#
# Cookbook Name:: .
# Recipe:: ruby
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# Ruby gem source
package 'gem'

bash 'gem sources' do
  code <<-EOH
    gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
  EOH
end

# # Create the chef
# directory "/etc/chef" do
#   recursive true
# end


# # Copy private key
# remote_file 'copy data bag keys' do
#   path "/etc/chef/data_bag_key"
#   source "file:///etc/chef/data_bag_key"
#   owner "root"
#   group "root"
#   mode 0755
# end
