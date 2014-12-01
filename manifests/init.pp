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
  $backend         = $::varnish::params::backend,
) inherits ::varnish::params {

  # validate parameters here

  class { '::varnish::install': } ->
  class { '::varnish::config': } ~>
  class { '::varnish::service': } ->
  Class['::varnish']
}
