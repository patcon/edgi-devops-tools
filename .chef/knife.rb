current_dir = File.dirname(__FILE__)

#cookbook_path [
#  './../edgi-cookbooks',
#  './../community-cookbooks',
#]

cookbook_path [File.expand_path('../../community-cookbooks' , __FILE__), File.expand_path('../../edgi-cookbooks' , __FILE__)]
local_mode true


knife['bootstrap_version'] = '12'
knife['ssh_user'] = 'root'
