# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_tor_node/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord_tor_node"
  spec.version       = ActiverecordTorNode::VERSION
  spec.authors       = ["jiikko"]
  spec.email         = ["n905i.1214@gmail.com"]

  spec.summary       = %q{detect access from tor for rails.}
  spec.description   = %q{detect access from tor for rails.}
  spec.homepage      = "https://github.com/jiikko/activerecord_tor_node"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
