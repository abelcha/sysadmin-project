# == Class: networking
#
# This class configures the hosts file to allow communication between the
# puppet master and puppet clients using the VirtualBox host-only network.
#
# === Parameters
#
# === Actions
#
# - Install custom hosts template
#
# === Requires
#
# === Sample Usage
#
#   class { 'networking': }
#

class networking {


  file { '/etc/hosts':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('networking/hosts.erb'),
  }
  	exec { "set gateway":
    path => ["/usr/bin/","/usr/sbin/","/sbin/"],
    command => "route add default gw 192.168.6.2",
    user => root,
	}

	exec { "delete interface":
    path => ["/usr/bin/","/usr/sbin/","/bin/"],
    command => "sudo ifconfig eth0 down",
    user => root,
	}

}
