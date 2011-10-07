define packages::declarer() {
  if ! $packages::packageshash[$name]['pkgname'] {
    $pkgname = $name
  } else {
    $pkgname = $packages::packageshash[$name]['pkgname']
  }
  
  @package { $name:
    ensure  => present,
    name    => $pkgname,
  }
}