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
