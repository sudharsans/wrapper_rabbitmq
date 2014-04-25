#
# Cookbook Name:: rabbitmq_wrapper
# Recipe:: default
#
# Copyright 2014, Freshdesk 
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rabbitmq::default"

rabbitmq_plugin "rabbitmq_management" do
  action :enable
  notifies :restart, "service[rabbitmq-server]"
end

chef_gem "chef-rewind"
require 'chef/rewind'

unwind "template[#{node['rabbitmq']['config_root']}/rabbitmq.config]"

template "#{node['rabbitmq']['config_root']}/rabbitmq.config" do
  source 'rabbitmq.config.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, "service[rabbitmq-server]"
end
