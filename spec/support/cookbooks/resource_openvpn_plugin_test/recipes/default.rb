# Encoding: UTF-8

attrs = node['resource_openvpn_plugin_test']

openvpn_plugin attrs['name'] do
  plugin_name attrs['plugin_name'] unless attrs['plugin_name'].nil?
  repo_name attrs['repo_name'] unless attrs['repo_name'].nil?
  package_name attrs['package_name'] unless attrs['package_name'].nil?
  version attrs['version'] unless attrs['version'].nil?
  action attrs['action'] unless attrs['action'].nil?
end
