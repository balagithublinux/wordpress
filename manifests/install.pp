class lampserver::install {

  package  { 'httpd':
         ensure => 'installed',
       }

 $pkgs_list_mysql = [
   'mariadb.x86_64',
   'mariadb-libs.x86_64',
   'mariadb-server.x86_64',
          ]

  package  { $pkgs_list_mysql:
         ensure => 'installed',
       }

   $pkgs_list_php = [
   'php.x86_64',
   'php-cli.x86_64',
   'php-common.x86_64',
   'libzip.x86_64',
          ]
      
     package  { $pkgs_list_php:
         ensure => 'installed',
       }


}
