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
  $package_name = $::varnish::params::package_name,
  $service_name = $::varnish::params::service_name,
) inherits ::varnish::params {

  # validate parameters here

  class { '::varnish::install': } ->
  class { '::varnish::config': } ~>
  class { '::varnish::service': } ->
  Class['::varnish']
}
