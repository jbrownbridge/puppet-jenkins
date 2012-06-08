class jenkins::user {
  # Add jenkins user shadow group for PAM authentication
  if (!defined(Group['jenkins'])) {
    group {
      'jenkins' :
        ensure => present;
    }
  }
  if (!defined(User['jenkins'])) {
    user {
      'jenkins' :
        ensure  => present,
        gid     => 'jenkins',
        groups  => 'shadow';
    }
  }

  Package['jenkins'] -> Group['jenkins'] -> User['jenkins']
}
