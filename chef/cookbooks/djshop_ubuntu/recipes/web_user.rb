#
# Cookbook Name:: .
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


group node['djshop_ubuntu']['group']

user node['djshop_ubuntu']['user'] do
  group 'web_admin'
  system true
  shell '/bin/bash'
end
