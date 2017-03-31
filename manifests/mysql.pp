class lampserver::mysql {
         
      file { '/tmp/mysqlc.sh':
           ensure => 'present',
           source => 'puppet:///modules/lampserver/vhosts/mysql-create-user-database.sh',
           mode => '755',
           }
 
       exec { 'mysqldbc':
       command => '/usr/bin/sh /tmp/mysqlc.sh',
       require => File['/tmp/mysqlc.sh'],
}
}
  
