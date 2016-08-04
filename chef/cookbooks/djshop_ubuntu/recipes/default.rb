#
# Cookbook Name:: djshop_ubuntu
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'djshop_ubuntu::firewall'
include_recipe 'djshop_ubuntu::web_user'
include_recipe 'djshop_ubuntu::ruby'
include_recipe 'djshop_ubuntu::nginx'

