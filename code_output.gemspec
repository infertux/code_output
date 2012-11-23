# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'code_output/version'

Gem::Specification.new do |gem|
  gem.name          = "code_output"
  gem.version       = CodeOutput::VERSION
  gem.authors       = ["Cédric Félizard"]
  gem.email         = ["cedric@felizard.fr"]
  gem.description   = %q{Inject a script output into the source file as comments.}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/infertux/code_output"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
end
