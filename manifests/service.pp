# == Class varnish::service
#
# This class is meant to be called from varnish.
# It ensure the service is running.
#
class varnish::service {

  service { $::varnish::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
