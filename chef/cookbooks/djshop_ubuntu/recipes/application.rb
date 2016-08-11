
package 'git'

# application node['djshop_ubuntu']['app_root'] do
#   git 'https://github.com/jccode/djshop.git'
# end

package 'python-dev'
package 'python-virtualenv'

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
end
