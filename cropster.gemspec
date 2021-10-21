lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cropster/version"

Gem::Specification.new do |spec|
  spec.name = "cropster"
  spec.version = Cropster::VERSION
  spec.authors = ["Casey Gipson", "Jordan Brock"]
  spec.email = ["caseyg@bluebottlecoffee.com", "jordan.brock@fivesenses.com.au"]
  spec.summary = "Interact with the Cropster V2 API"
  spec.description = "Interact with the Cropster V2 API"
  spec.homepage = ""
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "typhoeus"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "activesupport", "> 5"
  spec.add_development_dependency "bundler", "~> 2.2.11"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "webmock-fixtures"
end
