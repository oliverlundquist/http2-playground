package "apt-transport-https"
package "ca-certificates"

apt_repository "docker" do
  uri "https://apt.dockerproject.org/repo"
  distribution "ubuntu-trusty"
  components ["main"]
  keyserver "hkp://p80.pool.sks-keyservers.net:80"
  key "58118E89F3A912897C070ADBF76221572C52609D"
  action :add
end

execute "update package list" do
  command "sudo apt-get update -y"
  ignore_failure true
end

package "linux-image-extra-`uname -r`"
package "apparmor"
package "docker-engine"

service "docker" do
  supports restart: true, start: true, stop: true, status: true
  restart_command "/usr/sbin/service docker restart"
  start_command "/usr/sbin/service docker start"
  stop_command "/usr/sbin/service docker stop"
  status_command "ps aux | grep [d]ocker | grep daemon"
  action [:restart] # because :start returns exit code 1 if service is already running
end

execute "install docker-compose" do
  command "curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
end

file "/usr/local/bin/docker-compose" do
  owner "root"
  group "root"
  mode 0755
end
