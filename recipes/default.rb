#
# Cookbook Name:: weblogic
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

jrules_install_dir = "c:\\ILOG\\JRules673"
installer_url = node['jrules']['installer_url']

if File.exists?(jrules_install_dir)
  Chef::Log.info("#{jrules_install_dir} already exists.....not installing JRules")
else
  Chef::Log.info("#{jrules_install_dir} does not exist")

  installer_dir = node['jrules']['installer_dir'] 
  jrules_install_exe = "#{installer_dir}\\ILOG2.exe"

  remote_file "#{installer_dir}\\ILOG2.exe" do
    source "#{installer_url}"
    action :create_if_missing
  end

  execute "jrules" do
    Chef::Log.info("installer=#{jrules_install_exe}")
    command "#{jrules_install_exe}"
    action :run
  end
end

