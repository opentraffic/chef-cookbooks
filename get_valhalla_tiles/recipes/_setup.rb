#
# Cookbook Name:: get_valhalla_tiles
# Recipe:: _setup
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

# set up directory structure
dirs = [
  node[:get_valhalla_tiles][:base_dir],
  node[:get_valhalla_tiles][:log_dir],
  node[:get_valhalla_tiles][:tile_dir]
]

dirs.each do |dir|
  directory dir do
    owner 'root'
    recursive true
    not_if { ::File.directory?(dir) }
  end
end
