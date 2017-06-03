#
# Cookbook Name:: get_osmlr_tiles
# Recipe:: _setup
#
# Copyright 2017, Mapzen
#
# All rights reserved - Do Not Redistribute
#

# set up directory structure
dirs = [
  node[:get_osmlr_tiles][:base_dir],
  node[:get_osmlr_tiles][:log_dir],
  node[:get_osmlr_tiles][:tile_dir]
]

dirs.each do |dir|
  directory dir do
    owner 'root'
    recursive true
    not_if { ::File.directory?(dir) }
  end
end
