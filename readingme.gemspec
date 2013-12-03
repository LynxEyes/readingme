# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'readingme/version'

Gem::Specification.new do |spec|
  spec.name          = "readingme"
  spec.version       = Readingme::VERSION
  spec.authors       = ["LynxEyes"]
  spec.email         = ["ivo.jesus@gmail.com"]
  spec.description   = %q{Small Markdown to HTML encoder which uses Github readme stylesheet}
  spec.summary       = %q{Markdown to HTML encoder}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'listen'
  spec.add_dependency 'htmlentities'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
