class jenkins::vhost($vhost_name='*', $vhost_port=80) {
  include apache

  a2mod { "Enable proxy mod":
    name    => "proxy",
    ensure  => "present",
  } ->
  a2mod { "Enable proxy_http mod":
    name    => "proxy_http",
    ensure  => "present",
  } ->
  apache::vhost::proxy { 'jenkins':
    vhost_name  => $vhost_name,
    port        => $vhost_port,
    dest        => 'http://127.0.0.1:8080',
  }
}
