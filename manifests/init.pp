class packages {
  case $::osfamily {
    'RedHat': {
      $libdbd_mysql_perl  = 'perl-DBD-MySQL'
      $libdbi_perl        = 'libdbi-dbd-mysql'
      $libwww_perl        = 'perl-libwww-perl'
      $phpmssql           = 'php-mssql'
      $php_xml            = 'php-xml'
      $php5_cli           = 'php-cli'
      $php5_curl          = 'php'
      $php5               = 'php'
      $php5_gd            = 'php-gd'
      $php5_pear          = 'php-pear'
      $php5_mcrypt        = 'php-mcrypt'
      $php5_mysql         = 'php-mysql'
      $python_memcache    = 'python-memcached'
      $sysvinit_utils     = 'sysvinit-tools'
      $rails              = undef
      $sysstat            = 'sysstat'
    }
    'Debian': {
      $php_xml              = 'php5'
    }
    default: {
      fail('Unsupported osfamily')
    }
  }

  $packageshash = {
    'libactiverecord-ruby'     => $libactiverecord_ruby,
    'libapache2-mod-jk'        => $libapache2_mod_jk,
    'libapache2-mod-passenger' => $libapache2_mod_passenger,
    'libapache2-mod-php5'      => $libapache2_mod_php5,
    'libapache2-svn'           => $libapache2_svn,
    'libdbd-mysql-perl'        => $libdbd_mysql_perl,
    'libdbi-perl'              => $libdbi_perl,
    'libmysql-ruby'            => $libmysql_ruby,
    'libwww-perl'              => $libwww_perl,
    'php5-pear'                => $php5_pear,
    'php5'                     => $php5,
    'php5-cli'                 => $php5_cli,
    'php5-curl'                => $php5_curl,
    'php5-gd'                  => $php5_gd,
    'php5-mcrypt'              => $php5_mcrypt,
    'php5-mysql'               => $php5_mysql,
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
