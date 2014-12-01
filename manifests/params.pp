# == Class varnish::params
#
# This class is meant to be called from varnish.
# It sets variables according to platform.
#
class varnish::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'varnish'
      $service_name = 'varnish'
    }
    'RedHat', 'Amazon': {
      $package_name = 'varnish'
      $service_name = 'varnish'
    }
    'FreeBSD': {
      $package_name    = 'www/varnish'
      $service_name    = 'varnishd'
      $prefix          = '/usr/local'
      $config          = "$prefix/etc/varnish/default.vcl"
      $config_template = 'varnish/default.vcl.erb'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
