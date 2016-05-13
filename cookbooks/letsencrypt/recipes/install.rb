execute "install certbot" do
  command "curl -L https://dl.eff.org/certbot-auto > /usr/local/bin/certbot-auto"
end

file "/usr/local/bin/certbot-auto" do
  owner "root"
  group "root"
  mode 0755
end

directory node[:letsencrypt][:webroot] do
  owner "root"
  group "root"
  mode 0755
  recursive true
  action :create
end

# "/etc/letsencrypt/live"

# ln -s /bin /nas/users/foo/bin
# from /etc/letsencrypt/live
# to   /home/ubuntu/letsencrypt/ssl

# execute "update certbot" do
#   command "/usr/local/bin/certbot-auto certonly --test-cert --webroot -w #{node[:letsencrypt][:webroot]} -d #{node[:letsencrypt][:domain]} --agree-tos --email #{node[:letsencrypt][:email]} --non-interactive"
# end
