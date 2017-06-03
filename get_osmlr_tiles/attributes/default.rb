default[:get_osmlr_tiles][:base_dir] = '/data'
default[:get_osmlr_tiles][:log_dir]  = "#{node[:get_osmlr_tiles][:base_dir]}/logs"
default[:get_osmlr_tiles][:tile_dir] = "#{node[:get_osmlr_tiles][:base_dir]}/valhalla"

default[:get_osmlr_tiles][:s3bucket] = 'osmlr-tiles'
default[:get_osmlr_tiles][:s3path]   = 'prod'
