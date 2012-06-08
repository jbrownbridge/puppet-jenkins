class jenkins::firewall($vhost_port=80) {
  if defined('::firewall') {
    ::firewall {
      '500 allow Jenkins inbound traffic':
        action => 'accept',
        state  => 'NEW',
        dport  => [$vhost_port],
        proto  => 'tcp',
    }
  }
}

