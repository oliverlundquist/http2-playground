#update package list
execute "update package list" do
  command "sudo apt-get update -y"
  ignore_failure true
end

#common packages
package "git"
package "mysql-client-5.6"
package "build-essential"
package "libmysqld-dev" #needed for mysql support

#local cookbooks
include_recipe "admin_users::create_admin_users"
include_recipe "admin_users::customize_admin_users"
include_recipe "timezone::default"
include_recipe "logrotate::default"
include_recipe "ssh_host_key::default"
include_recipe "letsencrypt::install"
include_recipe "docker::install"
include_recipe "docker::compose"
