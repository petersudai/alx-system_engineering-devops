# Define exec resource to kill the process named killmenow
exec { 'killmenow':
  command     => 'pkill killmenow',
  path        => '/usr/bin',
  onlyif      => 'pgrep killmenow',
  refreshonly => true
}
