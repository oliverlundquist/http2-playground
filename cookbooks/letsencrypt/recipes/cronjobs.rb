# 01:20 & 13:20
cron "certbot-renew" do
  mailto "mail@oliverlundquist.com"
  user node[:admin_users][:ubuntu][:user]
  minute '20'
  hour '1,13'
  home node[:admin_users][:ubuntu][:home]
  command "/usr/local/bin/certbot-auto renew --quiet --no-self-upgrade"
  action :create
end
