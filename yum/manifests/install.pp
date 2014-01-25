# Class yum::install
class yum::install {
    package { ['yum-updatesd', 'yum-autoupdate']:
        ensure => absent,
    }
}