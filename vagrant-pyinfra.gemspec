require File.expand_path('../lib/vagrant-pyinfra/version', __FILE__)


Gem::Specification.new do |s|
  s.name            = 'vagrant-pyinfra'
  s.version         = Vagrant::Pyinfra::VERSION
  s.date            = '2016-12-28'
  s.summary         = 'Vagrant pyinfra provisioner.'
  s.description     = 'Provision Vagrant VMs with pyinfra.'
  s.authors         = ['Nick Barrett']
  s.email           = 'pointlessrambler@gmail.com'
  s.files           = `git ls-files`.split($\)
  s.executables     = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.require_paths   = ['lib']
  s.homepage        = ''
  s.license         = 'MIT'
end
