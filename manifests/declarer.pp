define packages::declarer() {
  if ! $packages::packageshash[$name] {
    $pkgname = $name
  } else {
    $pkgname = $packages::packageshash[$name]
  }
  
  @package { $name:
    ensure  => present,
    name    => $pkgname,
  }
}
