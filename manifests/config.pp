class lampserver::config {

file {'/etc/httpd/conf/httpd.conf':
   ensure => 'file',
   mode => '600',
   source => 'puppet:///modules/lampserver/vhosts/vhost.conf',

}


file {'/var/www/html/vhost1':
     ensure => 'directory',
     owner => 'root',
     group => 'root',
} 

file {'/var/www/html/vhost2':
     ensure => 'directory',
     owner  => 'root',
     group => 'root'
}


}

