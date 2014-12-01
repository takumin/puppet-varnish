# == Class varnish::config
#
# This class is called from varnish for service config.
#
class varnish::config {

  file { "$::varnish::config":
    ensure       => file,
    owner        => 0,
    group        => 0,
    mode         => '0644',
    content      => template($::varnish::config_template),
    validate_cmd => "$::varnish::prefix/sbin/varnishd -C -f %",
  }

  if $operatingsystem == 'freebsd' {
    exec { 'using config file':
      path    => [ '/usr/local/sbin', '/usr/sbin', '/usr/bin', '/bin' ],
      command => "sysrc -f /etc/rc.conf.d/varnishd varnishd_config=$::varnish::config",
      unless  => "sysrc -n -f /etc/rc.conf.d/varnishd varnishd_config"
    }
  }

}
