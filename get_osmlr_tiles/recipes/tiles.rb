#
# Cookbook Name:: get_osmlr_tiles
# Recipe:: default
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'get_osmlr_tiles::_setup'

stack = search('aws_opsworks_stack').first

execute 'pull tiles' do
  user 'root'
  command <<-EOH
    aws --region #{stack['region']} s3 cp \
      s3://#{node[:get_osmlr_tiles][:s3bucket]}/#{node[:get_osmlr_tiles][:s3path]}/#{node[:get_osmlr_tiles][:s3file]} #{node[:get_osmlr_tiles][:tile_dir]}/tiles.tgz &&
    gunzip -f tiles.tgz
  EOH
  retries 2
  retry_delay 30
  timeout 3600
end
