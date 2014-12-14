# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grimm/version'

Gem::Specification.new do |spec|
  spec.name          = "grimm"
  spec.version       = Grimm::VERSION
  spec.authors       = ["Jaimerson Araújo"]
  spec.email         = ["jaimersonaraujo@gmail.com"]
  spec.summary       = %q{A text-based game factory.}
  spec.description   = %q{A text-based game factory.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.1"
  spec.add_development_dependency "rake", "~> 10.0"
end
