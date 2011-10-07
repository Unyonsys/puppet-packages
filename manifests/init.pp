class packages {
  if $::lsbdistid in [ 'CentOS', 'RedHatEnterpriseServer' ] {
    $libdbd_mysql_perl  = 'perl-DBD-MySQL'
    $libdbi_perl        = 'libdbi-dbd-mysql'
    $python_memcache    = 'python-memcached'
    $phpmssql           = 'php-mssql'
    $phpxml             = 'php-xml'
    $sysvinit_utils     = 'sysvinit-tools'
  } else {
    $phpmssql             = 'php5-sybase'
    $phpxml               = 'php5-xml'
    $libactiverecord_ruby = 'libactiverecord-ruby'
    $libmysql_ruby        = 'libmysql-ruby'
  }
  
 
  $packageshash = {
    'libdbd-mysql-perl' =>
      { 'pkgname' => $libdbd_mysql_perl },
    'libdbi-perl' =>
      { 'pkgname' => $libdbi_perl },
    'python-memcache' =>
      { 'pkgname' => $python_memcache },
    'sysvinit-utils' =>
      { 'pkgname'  => $sysvinit_utils },
    'libactiverecord-ruby' =>
      { 'pkgname'  => $libactiverecord_ruby },
    'libmysql-ruby' =>
      { 'pkgname'  => $libmysql_ruby },
    'rails' =>
      { 'pkgname'  => $rails },
    'sysstat' =>
      { 'pkgname'  => $sysstat },
  }
  
  #Convert the hash keys into an array so we can pass it to a define
  $keys = keys( $packageshash )
  
  #Call the define with the generated array
  packages::declarer { $keys : }
}
