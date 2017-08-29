#
# Cookbook Name:: get_valhalla_tiles
# Recipe:: default
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'get_valhalla_tiles::_setup'

stack = search('aws_opsworks_stack').first

execute 'pull valhalla tiles' do
  user 'root'
  cwd  node[:get_valhalla_tiles][:tile_dir]
  command <<-EOH
    aws --region #{stack['region']} s3 cp \
      s3://#{node[:get_valhalla_tiles][:s3bucket]}/#{node[:get_valhalla_tiles][:s3file]} #{node[:get_valhalla_tiles][:tile_dir]}/tiles.tar
  EOH
  retries 2
  retry_delay 30
  timeout 3600
end
