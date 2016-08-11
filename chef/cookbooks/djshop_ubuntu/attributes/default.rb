
app_name = 'djshop'

default['firewall']['allow_ssh'] = true
default['djshop_ubuntu']['open_ports'] = 80

default['djshop_ubuntu']['user'] = 'web_admin'
default['djshop_ubuntu']['group'] = 'web_admin'

default['djshop_ubuntu']['document_root'] = '/srv/www/html'
default['djshop_ubuntu']['app_root'] = "/srv/app/#{app_name}"
default['djshop_ubuntu']['git_repo'] = 'https://github.com/jccode/djshop.git'

