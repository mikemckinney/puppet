class ordering {
file {'/home/mmckinney/tmp':
	ensure		=> directory,
	mode		=> 0644,
}	

notify {'tmp directory has been created.':
	require => File['/home/mmckinney/tmp'],
	}

file {'/home/mmckinney/tmp/tmporder1':
        require 	=> File['/home/mmckinney/tmp'], #requires tmp directory to be created before proceeding
	ensure		=> present,
	mode		=> 0644,
	content		=> "cheese, sucka.",

	}
}
