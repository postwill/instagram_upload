# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'instagram/version'

Gem::Specification.new do |spec|
  spec.name          = "instagram"
  spec.version       = Instagram::VERSION
  spec.authors       = ["bezrukavyi"]
  spec.email         = ["yaroslav.bezrukavyi@gmail.com"]

  spec.summary       = 'Instagram client'
  spec.description   = 'Instagram client'
  spec.homepage      = 'https://github.com/postwill/instagram'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency "curb", "~> 0.9.0"

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'rubocop', '~> 0.50.0'
end
