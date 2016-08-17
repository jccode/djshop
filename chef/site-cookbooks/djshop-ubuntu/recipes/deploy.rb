
# sync code
git node['djshop_ubuntu']['app_root'] do
  repository node['djshop_ubuntu']['git_repo']
  revision 'master'
  action :sync
end


application node['djshop_ubuntu']['app_root'] do
  virtualenv
  pip_requirements do
    user "root"
    group "root"
  end
  
  django do
    path "#{node['djshop_ubuntu']['app_root']}/src"
    settings_module "#{node['djshop_ubuntu']['app_name']}.settings_prod"
    migrate true
  end
end
