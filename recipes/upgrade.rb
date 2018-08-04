case node['platform']
  when 'rhel', 'centos'
  execute 'update yum pkgs' do
    command 'sudo yum update -y'
    action :run
  end
  when 'ubuntu'
    execute 'update apt pkgs' do
      command 'sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade'
      action :run
    end
  when 'windows'
    node.default['wsus_client']['update']['action'] = [ :download, :install ]
    include_recipe 'wsus-client::default'
end
