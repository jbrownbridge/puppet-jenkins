class jenkins($vhost_name='*', $vhost_port=80) {
  package {
    'jre':
        ensure => '1.7.0',
        noop   => true
  }
  include jenkins::repo
  include jenkins::package
  include jenkins::user
  include jenkins::config
  include jenkins::service
  include jenkins::firewall
  
  class { 'jenkins::firewall': 
      vhost_port => $vhost_port,
  }
  
  class { 'jenkins::vhost':
    vhost_name => $vhost_name,
    vhost_port => $vhost_port,
  }

  Class['jenkins::repo'] -> Class['jenkins::package'] -> Class['jenkins::user']
  -> Class['jenkins::config'] -> Class['jenkins::service']
  -> Class['jenkins::vhost']
}
# vim: ts=2 et sw=2 autoindent
