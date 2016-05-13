template "/home/ubuntu/docker-compose.yml" do
  source "docker-compose.yml.erb"
  mode 0644
  owner "ubuntu"
  group "ubuntu"
  action :create
end

execute "run docker-compose up" do
  cwd "/home/ubuntu"
  command "docker-compose --project-name='php-app-0001' up -d"
end
