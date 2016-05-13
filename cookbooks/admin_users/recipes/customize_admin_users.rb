node[:admin_users].each do |user_key, user|

  user[:groups].each do |group|
    group group do
      group_name group
      action :create
      not_if "grep #{group} /etc/passwd"
    end

    group group do
      append true
      members user[:user]
    end
  end

  template "#{user[:home]}/.bashrc" do
    source "bashrc.erb"
    mode 0644
    owner user[:user]
    group user[:group]
    action :create
  end

  template "#{user[:home]}/.profile" do
    source "profile.erb"
    mode 0644
    owner user[:user]
    group user[:group]
    action :create
  end

  directory "#{user[:home]}/.vim/colors/" do
    owner user[:user]
    group user[:group]
    mode 0775
    recursive true
  end

  cookbook_file "#{user[:home]}/.vim/colors/ir_black.vim" do
    owner user[:user]
    mode 0664
    source "ir_black.vim"
  end

  template "#{user[:home]}/.vim/vimrc" do
    source "vimrc.erb"
    owner user[:user]
    group user[:group]
    mode 0664
    action :create
  end

  #set right permissions on the .vim folder
  directory "#{user[:home]}/.vim" do
    owner user[:user]
    group user[:group]
    mode 0755
    action :create
  end

end
