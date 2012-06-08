class jenkins::user {
  # Add jenkins user shadow group for PAM authentication
  user {
    'jenkins' :
      ensure  => present,
      groups  => shadow,
  }

  Package['jenkins'] -> User['jenkins']
}
