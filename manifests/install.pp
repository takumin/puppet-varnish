# == Class varnish::install
#
# This class is called from varnish for install.
#
class varnish::install {

  package { $::varnish::package_name:
    ensure => present,
  }
}
