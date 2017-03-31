class lampserver::wordpress {

package  { 'wget':
         ensure => 'installed',
}


exec{'download-wordpress1':
   command => "/usr/bin/wget -q http://wordpress.org/latest.tar.gz -P /var/www/html/vhost1/",
   before => [Exec['untar1-gzip-latest.tar.gz'],Exec['untar2-gzip-latest.tar.gz'],File['/var/www/html/vhost1/wordpress'],File['/var/www/html/vhost2/wordpress']],
}

exec{'download-wordpress2':
   command => "/usr/bin/wget -q http://wordpress.org/latest.tar.gz -P /var/www/html/vhost2/",
   before => [Exec['untar1-gzip-latest.tar.gz'],Exec['untar2-gzip-latest.tar.gz'],File['/var/www/html/vhost1/wordpress'],File['/var/www/html/vhost2/wordpress']],
}

exec { 'untar1-gzip-latest.tar.gz':
     command => "/usr/bin/tar -xvzf /var/www/html/vhost1/latest.tar.gz",
     cwd     => '/var/www/html/vhost1', 
     require => Exec['download-wordpress1'],
}

exec { 'untar2-gzip-latest.tar.gz':
     command => "/usr/bin/tar -xvzf /var/www/html/vhost2/latest.tar.gz",
     cwd     => '/var/www/html/vhost2',
     require => Exec['download-wordpress2'],
}

file { '/var/www/html/vhost1/wordpress':
  ensure => 'directory',
  owner => 'root',
  group => 'root',
  require => [Exec['download-wordpress1'],Exec['untar1-gzip-latest.tar.gz']]
}


file { '/var/www/html/vhost2/wordpress':
  ensure => 'directory',
  owner => 'root',
  group => 'root',
  require => [Exec['download-wordpress2'],Exec['untar2-gzip-latest.tar.gz']]
}


}
