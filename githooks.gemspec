# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'githooks/version'

Gem::Specification.new do |gem|
  gem.name          = "githooks"
  gem.version       = Githooks::VERSION
  gem.authors       = ["Yu Zhang"]
  gem.email         = ["ian7zy@gmail.com"]
  gem.description   = %q{A git hooks framework in Ruby}
  gem.summary       = %q{A framework to manage git hooks with your source code}
  gem.homepage      = "https://github.com/ianzy/githooks"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  # Development Dependencies
  gem.add_development_dependency "rspec"
end
