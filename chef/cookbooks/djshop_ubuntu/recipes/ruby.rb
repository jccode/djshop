#
# Cookbook Name:: .
# Recipe:: ruby
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


package 'gem'

bash 'gem sources' do
  code <<-EOH
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
  EOH
end
