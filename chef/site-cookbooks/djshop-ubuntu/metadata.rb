name             'djshop-ubuntu'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures djshop-ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends 'apt', '~> 4.0.1'
depends 'firewall', '~> 2.5.2'
depends 'nginx_conf', '~> 1.0.1'
depends 'mysql', '~> 7.2.0'
depends 'application_python', '~> 4.0.0'
depends 'mysql2_chef_gem', '~> 1.1.0'
depends 'database', '~> 5.1.2'
