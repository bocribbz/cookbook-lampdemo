name             'cookbook-lampdemo'
maintainer       'Bob Cribbs'
maintainer_email 'foo@example.com'
license          'All rights reserved'
description      'Installs/Configures cookbook-lampdemo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apt", "2.1.1"
depends "mysql", "= 3.0.2"
depends "php", "= 1.2.2"
depends "apache2", "= 1.6.6" 
depends "database", "= 1.4.0"
