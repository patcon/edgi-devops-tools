current_dir = File.dirname(__FILE__)
local_mode = true

chef_repo_path = '..'

cookbook_path = [
  '../edgi-cookbooks',
  '../community-cookbooks',
]

knife['bootstrap_version'] = '12'
knife['ssh_user'] = 'root'
