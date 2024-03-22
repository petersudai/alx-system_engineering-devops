# Define file resource to create /tmp/school
file { '/tmp/school/':
  ensure  => present,
  content => 'I love Puppet',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
}
