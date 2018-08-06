patch_list = data_bag_item(node['patching']['data_bag_name'],
                           node['patching']['data_bag_item_name'])

patch_list['package'].each do |package_name, package_version|
  package "#{package_name}" do
    version "#{package_version}"
  end
end
