default[:get_valhalla_tiles][:base_dir] = '/data'
default[:get_valhalla_tiles][:log_dir]  = "#{node[:get_valhalla_tiles][:base_dir]}/logs"
default[:get_valhalla_tiles][:tile_dir] = "#{node[:get_valhalla_tiles][:base_dir]}/valhalla"

default[:get_valhalla_tiles][:s3bucket]  = 'reporter-tiles'
default[:get_valhalla_tiles][:s3file]    = 'planet_2018_03_31-00_33_54/planet_2018_03_31-00_33_54.tar'
