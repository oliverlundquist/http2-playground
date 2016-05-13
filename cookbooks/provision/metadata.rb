name             'provision'
maintainer       'Oliver Lundquist'
maintainer_email 'mail@oliverlundquist.com'
license          'All rights reserved'
description      'Provision Cookbook'
long_description 'Shortcut Chef Run-list for Provisioning'
version          '1.0.0'
supports         'ubuntu', '= 14.04'

#local cookbooks
depends "admin_users"
depends "docker"
depends "letsencrypt"
depends "logrotate"
depends "ssh_host_key"
depends "timezone"
