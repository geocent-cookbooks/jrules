#
# Cookbook Name:: weblogic
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

jrules_install_dir = node['jrules']['install_dir']
installer_url = node['jrules']['installer_url']
rulesstudio_url = node['jrules']['rulesstudio_url']

if File.exists?(jrules_install_dir)
  Chef::Log.info("#{jrules_install_dir} already exists.....not installing JRules")
else
  Chef::Log.info("#{jrules_install_dir} does not exist")

  installer_dir = "#{Chef::Config[:file_cache_path]}"
  jrules_install_exe = "#{installer_dir}\\ILOG.exe"
  rulesstudio_install_exe = "#{installer_dir}\\rulesstudio.exe"

  remote_file jrules_install_exe do
    source "#{installer_url}"
    action :create_if_missing
  end

  execute "jrules" do
    Chef::Log.info("installer=#{jrules_install_exe}")
    command "#{jrules_install_exe}"
    action :run
  end

  remote_file rulesstudio_install_exe do
    source "#{rulesstudio_url}"
    action :create_if_missing
  end

  execute "jrules" do
    Chef::Log.info("installer=#{rulesstudio__install_exe}")
    command "#{rulesstudio_install_exe}"
    action :run
  end
end

