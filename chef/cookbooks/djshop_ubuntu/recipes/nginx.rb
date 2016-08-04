

# Install nginx
package 'nginx'


# Service
service 'nginx' do
  action [:enable, :start]
  supports :status => true
end


# Configuration
nginx_conf_file "default" do
  action :disable
end

nginx_conf_file "localhost" do
  root node['djshop_ubuntu']['document_root']
  site_type :static
end


# Create the document root directory
directory node['djshop_ubuntu']['document_root'] do
  recursive true
end


# Write home page
file "#{node['djshop_ubuntu']['document_root']}/index.html" do
  content "<html>Hello world</html>"
  mode '0644'
  owner node['djshop_ubuntu']['user']
  group node['djshop_ubuntu']['group']
end

