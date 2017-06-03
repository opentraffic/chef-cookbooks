#
# Cookbook Name:: monitoring_scripts
# Recipe:: default
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

instance = search('aws_opsworks_instance', 'self:true').first
stack = search('aws_opsworks_stack').first

template '/usr/local/bin/disk_mon.sh' do
  owner   'root'
  mode    0740
  source  'disk_mon.sh.erb'
  variables(
    critical_sns_arn: node[:monitoring_scripts][:critical_sns_arn],
    relaxed_sns_arn: node[:monitoring_scripts][:relaxed_sns_arn],
    disk_threshold: node[:monitoring_scripts][:disk_threshold],
    instance_id: instance['ec2_instance_id'],
    public_ip: instance['public_ip'].gsub('.', '-'),
    region: stack['region']
  )
end

cron 'disk space monitor' do
  user    'root'
  minute  '*/5'
  hour    '*'
  command '/usr/local/bin/disk_mon.sh >/var/log/disk_mon.out 2>&1'
end
