#
# Cookbook Name:: get_osmlr_tiles
# Recipe:: geojson
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'get_osmlr_tiles::_setup'

stack = search('aws_opsworks_stack').first

execute 'pull geojson tiles' do
  user 'root'
  command <<-EOH
    aws --region #{stack['region']} s3 cp \
      s3://#{node[:get_osmlr_tiles][:s3bucket]}/#{node[:get_osmlr_tiles][:s3path]}/tiles_geojson.tgz \
      #{node[:get_osmlr_tiles][:tile_dir]}/tiles_geojson.tgz
  EOH
  retries 2
  retry_delay 30
  timeout 3600
end

execute 'extract geojson tiles' do
  user 'root'
  cwd node[:get_osmlr_tiles][:tile_dir]
  command 'tar zxf tiles_geojson.tgz'
end
