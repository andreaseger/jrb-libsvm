# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libsvm/version'

Gem::Specification.new do |gem|
  gem.name          = "jrb-libsvm"
  gem.version       = Libsvm::VERSION
  gem.authors       = ["Andreas Eger"]
  gem.email         = ["dev@eger-andreas.de"]
  gem.description   = %q{JRuby language bindings for libsvm}
  gem.summary       = %q{basic wrapper around the java libsvm libary}
  gem.homepage      = "https://github.com/sch1zo/jrb-libsvm"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # specify any dependencies here
  gem.add_development_dependency('rspec', '>= 2.7.0')

  gem.extensions << 'java/make_jar.rb'
end
