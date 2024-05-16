# Change the OS configuration for the holberton user to increase file descriptor limit
exec { 'change-os-configuration-for-holberton-user':
  command => 'ulimit -n 65535',
  user    => 'holberton',
  path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
}

