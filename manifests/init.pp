class packages {
  if $::lsbdistid in [ 'CentOS', 'RedHatEnterpriseServer' ] {
    $libdbd_mysql_perl  = 'perl-DBD-MySQL'
    $libdbi_perl        = 'libdbi-dbd-mysql'
    $phpmssql           = 'php-mssql'
    $phpxml             = 'php-xml'
    $python_memcache    = 'python-memcached'
    $sysvinit_utils     = 'sysvinit-tools'
  } else {
    $libactiverecord_ruby = 'libactiverecord-ruby'
    $libmysql_ruby        = 'libmysql-ruby'
    $phpmssql             = 'php5-sybase'
    $phpxml               = 'php5-xml'
  }
  
 
  $packageshash = {
    'libactiverecord-ruby'     => $libactiverecord_ruby,
    'libapache2-mod-jk'        => $libapache2-mod-jk,
    'libapache2-mod-passenger' => $libapache2-mod-passenger,
    'libapache2-mod-php5'      => $libapache2-mod-php5,
    'libapache2-svn'           => $libapache2-svn,
    'libdbd-mysql-perl'        => $libdbd_mysql_perl,
    'libdbi-perl'              => $libdbi_perl,
    'libmysql-ruby'            => $libmysql_ruby,
    'php-cli'                  => $php-cli,
    'php-pear'                 => $php-pear,
    'php5'                     => $php5,
    'php5-cli'                 => $php5-cli,
    'php5-curl'                => $php5-curl,
    'php5-gd'                  => $php5-gd,
    'php5-mcrypt'              => $php5-mcrypt,
    'php5-mysql'               => $php5-mysql,
    'python-memcache'          => $python_memcache,
    'rails'                    => $rails,
    'sysstat'                  => $sysstat,
    'sysvinit-utils'           => $sysvinit_utils,
  }
  
  #Convert the hash keys into an array so we can pass it to a define
  $keys = keys( $packageshash )
  
  #Call the define with the generated array
  packages::declarer { $keys : }
}

