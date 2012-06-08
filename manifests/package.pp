class jenkins::package {
  package {
    'jenkins' :
      ensure => installed;
  }
  
  # Add jenkins user shadow group for PAM authentication
  user {
    'jenkins' :
      ensure => present,
      groups => shadow;
  }

  Package['jenkins'] -> User['jenkins']
}

