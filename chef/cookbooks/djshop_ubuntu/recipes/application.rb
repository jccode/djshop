
package 'git'

# application node['djshop_ubuntu']['app_root'] do
#   git 'https://github.com/jccode/djshop.git'
# end

package 'python-dev'
package 'python-virtualenv'


mysql_config = data_bag_item("passwords", "mysql")

# Create app_root directory
directory node['djshop_ubuntu']['app_root'] do
  recursive true
end

# sync code
git node['djshop_ubuntu']['app_root'] do
  repository node['djshop_ubuntu']['git_repo']
  revision 'master'
  action :sync
end

# Create app_run directory
directory node['djshop_ubuntu']['app_run']do
  recursive true
end

# create gunicorn config file
template node['djshop_ubuntu']['gunicorn']['config'] do
  source 'gunicorn_config.py.erb'
  mode '0755'
end

application node['djshop_ubuntu']['app_root'] do
  virtualenv
  pip_requirements do
    user "root"
    group "root"
  end
  
  django do
    # database do
    #   engine "mysql"
    #   host node['djshop_ubuntu']['database']['host']
    #   name node['djshop_ubuntu']['database']['dbname']
    #   user node['djshop_ubuntu']['database']['admin_username']
    #   password mysql_config['password_admin']
    # end
    path "#{node['djshop_ubuntu']['app_root']}/src"
    settings_module "#{node['djshop_ubuntu']['app_name']}.settings_prod"
    migrate true
  end

  gunicorn do
    path "#{node['djshop_ubuntu']['app_root']}/src"
    service_name node['djshop_ubuntu']['app_name']
    config node['djshop_ubuntu']['gunicorn']['config']
    bind "unix:#{node['djshop_ubuntu']['gunicorn']['sock']}"
  end
  
end

