class opera { 

	Package {ensure => "installed", allowcdrom => "true"}

	package {wget:}

	exec { wget:
		command => 'wget deb.opera.com/opera-stable/pool/non-free/o/opera-stable/opera-stable_42.0.2393.85_amd64.deb',
		path => ['/usr/bin', '/usr/sbin',],
	}

	package {'opera-stable_42.0.2393.85_amd64.deb':
		provider => dpkg,
		source => '/etc/puppet/modules/opera/manifests/opera-stable_42.0.2393.85_amd64.deb',
	}

	file { "/home/xubuntu/Desktop/opera.desktop":
		content => template("/etc/puppet/modules/opera/opera-desktop"),
		ensure => present,
	}
}
