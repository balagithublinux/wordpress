class lampserver::service {

       service { 'httpd':
            ensure => 'running',
            enable => 'true',
}
 

      service { 'mariadb':
           ensure => 'running',
           enable => 'true',
}



}
