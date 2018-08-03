case node['platform']
  when 'rhel', 'centos'
  #
  when 'ubuntu'
    execute 'update apt' do
      command 'sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade'
      action :run
    end
  when 'windows'
    #include_recipe 'wsus-client::default'
end
