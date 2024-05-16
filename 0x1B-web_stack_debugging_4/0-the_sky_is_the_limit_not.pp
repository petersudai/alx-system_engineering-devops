# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin',
  onlyif  => 'grep -q "ULIMIT=15" /etc/default/nginx',
  notify  => Exec['nginx-restart'],
}

# Restart Nginx to apply changes
exec { 'nginx-restart':
  command => 'service nginx restart',
  path    => '/etc/init.d/'
  refreshonly => true,
}
