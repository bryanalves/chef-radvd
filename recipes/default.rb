include_recipe 'sysctl::default'

sysctl_param 'net.ipv6.conf.all.forwarding' do
  value 1
end

package 'radvd'

template '/etc/radvd.conf' do
  source 'radvd.conf.erb'
  user 'root'
  group 'root'

  variables(
    interface: node['radvd']['interface'],
    interface_options: node['radvd']['interface_options'],
    prefixes: node['radvd']['prefixes']
  )
  notifies :restart, 'service[radvd]'
end

service 'radvd' do
  action [:enable, :start]
end
