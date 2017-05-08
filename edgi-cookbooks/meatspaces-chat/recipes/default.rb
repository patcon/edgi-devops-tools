include_recipe 'chef_nginx::default'

package 'ssl-cert'

nginx_site 'meatspaces' do
  template 'nginx_meatspaces.conf.erb'
  cookbook cookbook_name
end

install_path = '/opt/meatspace'

git install_path do
  repository 'https://github.com/patcon/meatspace-chat-v2'
  branch 'edgi'
  notifies :restart, 'service[meatspace]'
end

node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '4.8.3'
node.default['nodejs']['binary']['checksum'] = '52382b93865a5edd834db10e8f60822680d26dc2b8cadccafc351b0082a9052a'
include_recipe 'nodejs'

nodejs_npm 'yarn'
package 'python'
include_recipe 'build-essential'
execute 'yarn install' do
  cwd install_path
  environment 'PATH' => "/usr/local/nodejs-binary-4.8.3/bin:#{ENV['PATH']}"
end

nodejs_npm 'gulp'
execute 'gulp css js static' do
  cwd install_path
  environment 'PATH' => "/usr/local/nodejs-binary-4.8.3/bin:#{ENV['PATH']}"
end

file "#{install_path}/local.json" do
  content Chef::JSONCompat.to_json_pretty(node['meatspaces-chat']['config'].to_hash)
  notifies :restart, 'service[meatspace]'
end

package 'ffmpeg'

include_recipe 'pleaserun'

pleaserun 'meatspace' do
  chdir install_path
  program '/usr/local/bin/node'
  args %w[index.js]
end

service 'meatspace' do
  action [:enable, :start]
end
