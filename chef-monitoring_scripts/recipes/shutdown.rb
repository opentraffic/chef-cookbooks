#
# Cookbook Name:: monitoring_scripts
# Recipe:: shutdown
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

cron 'disk space monitor' do
  action :delete
end

execute '/usr/local/bin/disk_mon.sh shutdown'
