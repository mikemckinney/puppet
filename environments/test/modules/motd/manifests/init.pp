#motd


class motd {  

	$message = "Hello! My name is ${::hostname}. My IP is currently ${::ipaddress} and I'm running ${::operatingsystem}. Currently I have been up for ${::uptime}\n"

	file { "/etc/motd":
        	ensure  => 'present',
	        owner   => 'root',
        	group   => 'root',
	        mode    => '0644',
        	content => $message,
    }
	notify {"updated motd":}
} 
 
      


