# Installs and configures nginx
package { 'nginx':
  ensure   => '1.18.0',
  provider => 'apt',
}

file { 'Hello World!':
	 ensure  => '/var/www/html/index.nginx-debian.html',
	 content => 'Hello World!',
}

file_line { 'Hello World!':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => '\trewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

exec { 'service':
  command  => 'service nginx start',
  provider => 'bash',
  user     => 'root',
  path     => '/usr/sbin/service',
}