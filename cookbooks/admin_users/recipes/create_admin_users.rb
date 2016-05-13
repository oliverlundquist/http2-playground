#fix: You must have ruby-shadow installed for password support!
chef_gem "ruby-shadow" do
  version "2.3.4"
  action :install
end

node[:admin_users].each do |user_key, user|

  group user[:group] do
    group_name user[:group]
    action :create
  end

  user user[:user] do
    comment "#{user[:user]} admin user"
    group user[:group]
    password user[:password]
    home user[:home]
    shell user[:shell]
    supports :manage_home => true
    action :create
  end

  group user[:group] do
    append true
    members user[:user]
  end

  #set right permissions on home directory
  directory user[:home] do
    owner user[:user]
    group user[:group]
    mode 0755
    action :create
  end

  #$HOME/`whoami`/commands
  directory "#{user[:home]}/commands" do
    owner user[:user]
    group user[:group]
    mode 0755
    action :create
  end

  #$HOME/`whoami`/commands/backups
  directory "#{user[:home]}/commands/backups" do
    owner user[:user]
    group user[:group]
    mode 0755
    action :create
  end

  #$HOME/`whoami`/commands/lockfiles
  directory "#{user[:home]}/commands/lockfiles" do
    owner user[:user]
    group user[:group]
    mode 0755
    action :create
  end

  template "/etc/sudoers.d/#{user[:user]}" do
    source "sudoers.erb"
    mode 0440
    owner 'root'
    group 'root'
    variables(
      :username => user[:user]
    )
    action :create
  end

  directory "#{user[:home]}/.ssh" do
    owner user[:user]
    group user[:group]
    mode 0700
    action :create
  end

  cookbook_file "#{user[:home]}/.ssh/authorized_keys" do
    owner user[:user]
    group user[:group]
    mode 0600
    source "#{user[:user]}_#{node[:environment]}_key"
  end
end
