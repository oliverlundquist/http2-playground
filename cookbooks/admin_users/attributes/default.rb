default[:admin_users][:ubuntu][:user] = "ubuntu"
default[:admin_users][:ubuntu][:group] = "ubuntu"
default[:admin_users][:ubuntu][:groups] = ['adm', 'dialout', 'cdrom', 'floppy', 'sudo', 'audio', 'dip', 'video', 'plugdev', 'netdev', 'ubuntu', 'www-data', 'rbenv', 'vagrant', 'docker']
default[:admin_users][:ubuntu][:home] = "/home/ubuntu"
default[:admin_users][:ubuntu][:shell] = "/bin/bash"
default[:admin_users][:ubuntu][:password] = "$6$WnRZT7s7$YUx0Omc30bp8sqB3gDNoDVZfQ6WfxP6LPLkS8krt6PRKhc4mKXbMIxBvuOt/RARP2ggJWbABScTljv9UB/.yZ0" # = ubuntu
