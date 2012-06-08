define jenkins::vhost($vhost_name='*', $vhost_port=80) {
  include apache
  apache::vhost::proxy { 'jenkins':
    vhost_name  => $vhost_name,
    port        => $vhost_port,
    dest        => 'http://127.0.0.1:8080',
  }
}
