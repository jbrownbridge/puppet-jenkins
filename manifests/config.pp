class jenkins::config {
    $jenkins_config_file = '/var/lib/jenkins/config.xml'

    file { $jenkins_config_file:
        ensure  => present,
        owner   => jenkins,
        group   => jenkins,
        mode    => 0644,
        source  => 'puppet:///modules/jenkins/config.xml',
        require => [
            Package['jenkins'],
            User['jenkins'],
            Group['jenkins'],
        ],
        notify  => Service['jenkins'],
    }
}
