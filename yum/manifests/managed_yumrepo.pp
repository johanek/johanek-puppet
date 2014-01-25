# = Definition: yum::managed_yumrepo
#
# Add yum repository
#
#== Requirements
# Yum
#
# == Parameters
#
# [*descr*]
#   Description
#
# [*baseurl*]
#   Base URL
#
# [*mirrorlist*]
#   Mirror list of URLs
#
# [*enabled*]
#   Set to '1' to enable repo
#
# [*gpgcheck*]
#   Set to '1' to enable gpg check
#
# [*gpgkey*]
#   GPG key for repo
#
# [*failovermethod*]
#   Failover Methods
#
# [*priority*]
#   Repo priority
#
# [*exclude*]
#   RPM exclude list
#
# [*autokeyimport*]
#   Set to 'yes' to automatically import gpg key
#
# [*includepkgs*]
#   Include packages
#
# == Sample Usage:
#  yum::managed_yumrepo { 'foreman':
#    descr     => 'Foreman',
#    baseurl   => 'http://yum.theforeman.org/stable/',
#    enabled   => 1,
#    gpgcheck  => 0,
#  }
#
define yum::managed_yumrepo (
    $descr = 'absent',
    $baseurl = 'absent',
    $mirrorlist = 'absent',
    $enabled = 0,
    $gpgcheck = 0,
    $gpgkey = 'absent',
    $failovermethod = 'absent',
    $priority = 99,
    $exclude = 'absent',
    $autokeyimport = 'no',
    $includepkgs = 'absent') {

    file { "/etc/yum.repos.d/${name}.repo":
        ensure  => file,
        replace => false,
        before  => Yumrepo[$name],
        require => Class['yum::config'],
        mode    => '0644',
        owner   => 'root',
        group   => 'root'
    }
    yumrepo { $name:
        descr          => $descr,
        baseurl        => $baseurl,
        mirrorlist     => $mirrorlist,
        enabled        => $enabled,
        gpgcheck       => $gpgcheck,
        gpgkey         => $gpgkey,
        failovermethod => $failovermethod,
        priority       => $priority,
        exclude        => $exclude,
        includepkgs    => $includepkgs,
        require        => [Class['yum'],File['rpm_gpg']],
    }
    if $autokeyimport == 'yes' and $gpgkey != ''{
        exec { "rpmkey_add_${gpgkey}":
            command     => "rpm --import ${gpgkey}",
            before      => Yumrepo[$name],
            refreshonly => true,
        }
    }
}