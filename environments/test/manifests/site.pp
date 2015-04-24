node 'fed20a.miketmckinney.com' {
	include motd
}
node 'puppet.miketmckinney.com' {
	include motd
}

node 'centy.miketmckinney.com'{
	include motd
	#include ssh
	include base
	include wordpress
	include ruby
	include ordering
	class { '::ntp':
 	  servers => [ '0.us.pool.ntp.org', '1.us.pool.ntp.org' ],
	}

        package { 'openssh-server':
          ensure        => present,
          before        => File['/etc/ssh/sshd_config'],
        }
        file { '/etc/ssh/sshd_config':
          ensure        => file,
          mode          => 600,
          source        => '/root/examples/sshd_config',
        }

        service { 'sshd':
          ensure        => running,
          enable        => true,
          subscribe     => File['/etc/ssh/sshd_config'],
        }
	notify {'sshd_config has been synced':
	  require 	=> File['/etc/ssh/sshd_config'],
	}
}
