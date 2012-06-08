class jenkins::user {
  # Stub for group created by package
  group { 'jenkins': }
  
  # Add jenkins user shadow group for PAM authentication
  user {
    'jenkins' :
      ensure => present,
      groups => shadow;
  }

  Package['jenkins'] -> Group['jenkins'] -> User['jenkins']
}
