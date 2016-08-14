
app_name = 'djshop'
app_root = "/srv/app/#{app_name}"
app_run = "#{app_root}/run"

default['firewall']['allow_ssh'] = true
default['djshop_ubuntu']['open_ports'] = 80

default['djshop_ubuntu']['user'] = 'web_admin'
default['djshop_ubuntu']['group'] = 'web_admin'

default['djshop_ubuntu']['document_root'] = '/srv/www/html'
default['djshop_ubuntu']['app_name'] = app_name
default['djshop_ubuntu']['app_root'] = app_root
default['djshop_ubuntu']['app_run'] = app_run
default['djshop_ubuntu']['git_repo'] = 'https://github.com/jccode/djshop.git'

default['djshop_ubuntu']['database']['dbname'] = 'djshop'
default['djshop_ubuntu']['database']['host'] = '127.0.0.1'
default['djshop_ubuntu']['database']['root_username'] = 'root'
default['djshop_ubuntu']['database']['admin_username'] = 'djshop'


default['djshop_ubuntu']['gunicorn']['config'] = "#{app_run}/gunicorn_config.py"
default['djshop_ubuntu']['gunicorn']['sock'] = "#{app_run}/gunicorn.sock"
default['djshop_ubuntu']['gunicorn']['errorlog'] = "#{app_run}/error.log"
default['djshop_ubuntu']['gunicorn']['accesslog'] = "#{app_run}/access.log"
