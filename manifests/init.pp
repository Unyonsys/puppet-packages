# == Class packages
#
# This class is used to install packages which cannot be bound to specific modules.
# Puppet resource being unique, we need one place to declare packages potentially used
# in different places.
# It will mostly contain libraries which might be used by multiple modules.
#
# The name we use as the package reference name is the Debian/Ubuntu like name.
#
# === Contact
#
# Bruno Leon <bruno.leon@unyonsys.com>
#
# === Copyright
#
# Copyright (C) 2011 Savoir-faire Linux Inc.
# Copyright (C) 2012-2014 Unyonsys SARL
#
class packages {
  case $::osfamily {
    'RedHat': {
      $libdbd_mysql_perl  = 'perl-DBD-MySQL'
      $libdbi_perl        = 'libdbi-dbd-mysql'
      $libwww_perl        = 'perl-libwww-perl'
      $libredis_perl      = 'perl-Redis'
      $liboping0          = 'liboping'
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
    'libapache2-mod-fastcgi'   => $libapache2_mod_fastcgi,
    'libapache2-mod-jk'        => $libapache2_mod_jk,
    'libapache2-mod-passenger' => $libapache2_mod_passenger,
    'libapache2-mod-php5'      => $libapache2_mod_php5,
    'libapache2-svn'           => $libapache2_svn,
    'libdbd-mysql-perl'        => $libdbd_mysql_perl,
    'libdbi-perl'              => $libdbi_perl,
    'libredis-perl'            => $libredis_perl,
    'libmysql-ruby'            => $libmysql_ruby,
    'libnet-ldap-perl'         => $libnet_ldap_perl,
    'libdate-manip-perl'       => $libdate_manip_perl,
    'libwww-perl'              => $libwww_perl,
    'liboping0'                => $liboping0,
    'python-memcache'          => $python_memcache,
    'python-pip'               => $python_pip,
    'python-setuptools'        => $python_setuptools,
    'python-redis'             => $python_redis,
    'python-dev'               => $python_dev,
    'rails'                    => $rails,
    'sysstat'                  => $sysstat,
    'sysvinit-utils'           => $sysvinit_utils,
  }

  #Convert the hash keys into an array so we can pass it to a define
  $keys = keys( $packageshash )

  #Call the define with the generated array
  packages::declarer { $keys : }
}
