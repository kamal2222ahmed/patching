default['patching']['enabled'] = false
default['patching']['feed'] = false
default['wsus_client']['update']['action'] = [ :nothing ]
default['patching']['data_bag_name']      = "#{node['platform']}_patchlist"
default['patching']['data_bag_item_name'] = node.chef_environment
