class ldap {

file { '/home/vagrant/package.sh':
owner   => 'root',
group   => 'root',
mode    => '0755',
content => template('ldap/package.erb'),
}

file { '/home/vagrant/ldif.sh':
owner   => 'root',
group   => 'root',
mode    => '0755',
content => template('ldap/ldif.erb'),
}

file { '/home/vagrant/default.ldif':
owner   => 'root',
group   => 'root',
mode    => '0755',
content => template('ldap/default.erb'),
}

file { '/home/vagrant/manager.ldif':
owner   => 'root',
group   => 'root',
mode    => '0755',
content => template('ldap/manager.erb'),
}

exec { 'install package':
path => ["/usr/bin/","/usr/sbin/","/sbin/"],
command => 'bash /home/vagrant/package.sh',
user    => 'root',
group   => 'root',
}

exec { 'setup ldif':
path => ["/usr/bin/","/usr/sbin/","/sbin/"],
command => 'bash /home/vagrant/ldif.sh',
user    => 'root',
group   => 'root',
}

}
