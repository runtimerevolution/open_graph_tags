# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_graph_tags/version'

Gem::Specification.new do |spec|
  spec.name          = "open_graph_tags"
  spec.version       = OpenGraphTags::VERSION
  spec.authors       = ["Runtime Revolution"]
  spec.description   = %q{OpenGraphTags allows you to easily include open graph meta tags in your views from meta information defined in Comfy pages}
  spec.summary       = %q{A simple gem to include meta information defined in Comfy pages as open graph meta tags in your views}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["{app,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "Gemfile", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "railties"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rspec"
end
