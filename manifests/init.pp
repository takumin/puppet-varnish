# == Class: varnish
#
# Full description of class varnish here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class varnish (
  $package_name    = $::varnish::params::package_name,
  $service_name    = $::varnish::params::service_name,
  $prefix          = $::varnish::params::prefix,
  $config          = $::varnish::params::config,
  $config_template = $::varnish::params::config_template,
  $storage         = $::varnish::params::storage,
  $backend         = $::varnish::params::backend,
) inherits ::varnish::params {

  $type = $storage[type]
  $path = $storage[path]
  $size = $storage[size]
  $granularity = $storage[granularity]

  case $type {
    'malloc': {
      if $size {
        $storage_config = "malloc,$size"
      } else {
        $storage_config = "malloc"
      }
    }
    'file': {
      if $path {
        if $size {
          if $granularity {
            $storage_config = "file,$path,$size,$granularity"
          } else {
            $storage_config = "file,$path,$size"
          }
        } else {
          $storage_config = "file,$path"
        }
      } else {
        $storage_config = "file"
      }
    }
    'persistent': {
      if $path and $size {
        $storage_config = "persistent,$path,$size"
      } else {
        fail('persistent is require path, size')
      }
    }
    default: {
      fail('$"type" is malloc or file or persistent')
    }
  }

  class { '::varnish::install': } ->
  class { '::varnish::config': } ~>
  class { '::varnish::service': } ->
  Class['::varnish']
}
