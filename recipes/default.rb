#
# Cookbook:: patching
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform']
  when 'rhel','centos'
    execute 'update yum repository' do
      command 'yum check-update'
      action :run
      returns [0, 100]
    end
    # yum_repository 'DEV Repo' do
    #   description 'DEV YUM repository'
    #   mirrorlist 'http://artifacts.ourco.org/mirrorlist?repo=ourco-6&arch=$basearch'
    #   gpgkey 'http://artifacts.ourco.org/pub/yum/RPM-GPG-KEY-OURCO-6'
    #   action :create
    # end
  when 'ubuntu'
    apt_update 'update apt repository' do
      action :update
    end
  when 'windows'
    service 'wuauserv' do
      action [ :enable, :start ]
    end
    include_recipe 'wsus-client::configure'
end
if node['patching']['enabled'] == true
  if node['patching']['feed'] == false
    include_recipe 'patching::upgrade'
  else
    include_recipe 'patching::upgrade_feed'
  end
end
