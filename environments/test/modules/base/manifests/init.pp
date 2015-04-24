class  base {


	  $ssh_key  =  '$6$85k2At2qhEN92Vz7$ZPmNIVHAkWXTrzY0C0RPmjlbFPpqoNPUCdpb.le0I.2mSwFC5CahuwinL.I59AReLLCuDdXU04TcpRJlX5WWs/'

# user mmckinney
	user { 'mmckinney':
	  ensure 		=> 'present',
	  comment		=> 'me',
	  gid 	 		=> '500',
	  groups 		=> 'wheel',
	  home   		=> '/home/mmckinney',
	  password 		=> $ssh_key,
	  password_max_age 	=> '99999',
	  password_min_age 	=> '0',
	  shell  		=> '/bin/bash',
	  uid           	=> '500',
	}

# user root

	user { 'root':
	  ensure		=> 'present',
	  comment		=> 'root',
	  gid			=> '0',
	  groups		=> 'root', 
	  home			=> '/root',
	  password		=> $ssh_key,
	  password_max_age	=> '99999',
	  password_min_age	=> '0',
	  shell			=> '/bin/bash',
	  uid			=> '0',
	}
}
#user testuser

