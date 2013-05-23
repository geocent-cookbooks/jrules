#
# Cookbook Name:: jrules
# Recipe:: default
#
# Copyright 2012, Geocent
#
# All rights reserved - Do Not Redistribute
#

jrules_install_dir = "c:\\ILOG\\JRules711"
rulesstudio_install_dir = "c:\\ILOG\\JRules711\\eclipse"

if File.exists?(jrules_install_dir)
  Chef::Log.info("#{jrules_install_dir} already exists.....not installing JRules")
else
  windows_package "jrules" do
    source node['jrules']['installer_url']
    action :install
    installer_type :custom
  end
end

if File.exists?(rulesstudio_install_dir)
  Chef::Log.info("#{rulesstudio_install_dir} already exists.....not installing rulesstudio")
else
  windows_package "rulesstudio" do
    source node['jrules']['rulesstudio_url']
    action :install
    installer_type :custom
  end
end
