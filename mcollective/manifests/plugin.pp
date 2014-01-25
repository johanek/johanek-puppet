# Class mcollective::plugin
define mcollective::plugin (
  $source,
  $type='plugin',
  $repo='puppetlabs'
) {

  include mcollective::params

  $localpath = $type ? {
    client  => "/usr/local/bin/${name}",
    default => "/usr/libexec/mcollective/mcollective/${name}",
  }

  $filemode = $type ? {
    client  => '0555',
    default => '0444',
  }

  file { $localpath:
    owner   => root,
    group   => root,
    mode    => $filemode,
    require => Class['mcollective::server::install'],
    notify  => Class['mcollective::server::service'],
    source  => "puppet:///modules/mcollective/mcollective-plugins/${repo}/${source}",
  }
}
