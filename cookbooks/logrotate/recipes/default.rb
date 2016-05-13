#setup hourly logrotate
template "/etc/cron.hourly/logrotate" do
  source "logrotate.erb"
  owner "root"
  group "root"
  mode 0755
  action :create
end

#logrotate rsyslog
template "/etc/logrotate.d/rsyslog" do
  source "logrotate_rsyslog.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end
