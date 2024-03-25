#  using Puppet to make changes to our configuration file

include stdlib

file_line { 'SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => 'IdentityFile ~/.ssh/school',
  match              => '^#?\s*IdentityFile\s+~/.ssh/id_rsa',
  ensure             => present,
}

file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',
  line               => 'PasswordAuthentication no',
  match              => '^#?\s*PasswordAuthentication\s+(yes|no)$',
  ensure             => present,
}
