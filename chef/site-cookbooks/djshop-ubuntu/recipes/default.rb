#
# Cookbook Name:: djshop-ubuntu
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt::default'
include_recipe 'djshop-ubuntu::prepare'
include_recipe 'djshop-ubuntu::firewall'
include_recipe 'djshop-ubuntu::web_user'
include_recipe 'djshop-ubuntu::nginx'
include_recipe 'djshop-ubuntu::database'
include_recipe 'djshop-ubuntu::application'
