#  using Puppet to make changes to our configuration file
include stdlib

file_line { 'Turn off passwd auth':
  path  => '/etc/ssh/ssh_config',
  line  => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path  => '/etc/ssh/ssh_config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^#*\s*IdentityFile.*',
}
