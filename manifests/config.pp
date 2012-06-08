class jenkins::config {
    $jenkins_config_file = '/var/lib/jenkins/config.xml'

    file { $jenkins_config_file:
        ensure  => present,
        owner   => jenkins,
        group   => jenkins,
        mode    => 0644,
        source  => 'puppet:///jenkins/config.xml',
    }

    # Add jenkins user shadow group for PAM authentication
    User['jenkins'] { groups +> 'shadow' }

    File[$jenkins_config_file] -> User['jenkins']
}
