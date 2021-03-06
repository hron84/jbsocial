# Chef data JSON
data = {
  'run_list' => [
    'recipe[apt]',
    'recipe[build-essential]',
    'recipe[nginx]',
    'recipe[postgresql]',
    'recipe[postgresql::server]',
    'recipe[postgresql::ruby]',
    'recipe[rvm]',
    'recipe[rvm::vagrant]',
    'recipe[rvm::user]',
    'recipe[sphinx]',
    'recipe[vim]',
    'recipe[jbsocial]', # KEEP IT LAST
  ],
  'rvm' => {
    'default_ruby' => 'ruby-1.9.3-p392',
    'global_gems' => [
      { 'name' => 'bundler', 'version' => '1.3.3' },
      { 'name' => 'rake', 'version' => '10.0.3' },
      { 'name' => 'chef', 'version' => '11.4.0' },
      { 'name' => 'librarian', 'version' => '0.0.26' },
    ],
    'user_global_gems' => [
      { 'name' => 'bundler', 'version' => '1.3.3' },
      { 'name' => 'rake', 'version' => '10.0.3' },
      { 'name' => 'librarian', 'version' => '0.0.26' },
    ],
    'user_installs' => [
      {
        'user' => 'vagrant',
        'default_ruby' => 'ruby-1.9.3-p392',
      },
    ]
  },
  'postgresql' => {
    'password' => {
      'postgres' => 'Helloka123',
      'jbsocial' => 'yoo3Ua7zohwuokoh'
    },
  },
}

# END JSON

if $0 == __FILE__
  require 'json'
  File.open(__FILE__.sub(/\.rb$/, '.json'), 'w') { |fp| fp.write data.to_json }
else
  return data
end
