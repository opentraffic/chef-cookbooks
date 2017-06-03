#
# Cookbook Name:: jupyter
# Recipe:: default
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

# fix perms on work volume
directory '/data/work' do
  owner 'root'
  group 'users'
  mode  0775
end

# backup notebooks to s3
cron 'backup to s3' do
  user    'root'
  minute  '*/5'
  hour    '*'
  command "aws s3 sync #{node[:jupyter][:work_dir]} s3://#{node[:jupyter][:s3_bucket]} >/var/log/jupyter_backup.log 2>&1"
end
