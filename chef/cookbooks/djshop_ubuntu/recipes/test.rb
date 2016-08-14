
# Install nginx
package 'nginx'


# Service
service 'nginx' do
  action [:enable, :start]
  supports :status => true
end

# socket "/tmp/unicorn.socket"
nginx_conf_file "mywebsite.com" do
  socket "/tmp/unicorn.socket"
  locations({
             '/static/' => {
                            'root' => '/srv/app/djshop/src/public/static'
                           },
             '/media' => {
                          'root' => '/srv/app/djshop/src/public/media'
                         }
            })
end


