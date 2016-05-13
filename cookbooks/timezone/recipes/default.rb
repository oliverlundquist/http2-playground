link "/etc/localtime" do
  to "/usr/share/zoneinfo/#{node[:timezone][:tz]}"
end

#restart daemons to make them pick up the new timezone
%w{rsyslog cron}.each do |service|
  service service do
    supports :status => true, restart: true, start: true, stop: true
    status_command  "/usr/sbin/service #{service} status"
    restart_command "/usr/sbin/service #{service} restart"
    start_command   "/usr/sbin/service #{service} start"
    stop_command    "/usr/sbin/service #{service} stop"
    action :nothing
  end
  
  execute "restart #{service}" do
    command "/bin/cat /dev/null"
    notifies :restart, "service[#{service}]"
  end
  
end
