# Class admintools::install
class admintools::install {
  # Performance profiling tools
  package { ['sysstat', 'strace']:
    ensure => present
  }
  # Network tools
  package { ['telnet', 'socat', 'iptraf-ng', 'curl', 'wget', 'bind-utils', 'lftp']:
    ensure => present
  }
  # Debugging
  package { ['gdb']:
    ensure => present
  }
  # General
  package { ['dos2unix', 'git', 'man', 'screen', 'file', 'tmux']:
    ensure => present
  }
  # File management
  package { 'rsync':
    ensure => present
  }
}
