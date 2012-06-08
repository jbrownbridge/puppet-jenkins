class jenkins::package {
  package {
    'jenkins' :
      ensure => installed;
  }

  user {
    'jenkins' :
      ensure => present;
  }

  Package['jenkins'] -> User['jenkins']
}

