# Class: foreman
#
# This module manages the foreman dashboard and ENC tool.
#
# Sample Usage: `include foreman`
import "apt"

class foreman {
  execute { "install_foreman_asc":
    command => "wget -q http://deb.theforeman.org/foreman.asc -O- | sudo apt-key add -",
  }

  apt::source { "foreman":
    location => "http://deb.theforeman.org",
    release  => "stable",
    repos    => "main",
    require  => Exec["install_foreman_asc"],
  }

  package { "foreman":
    ensure  => installed,
  }

  package { "foreman-mysql":
    ensure => installed,
  }
}
