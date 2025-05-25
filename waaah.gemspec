Gem::Specification.new do |spec|
  spec.name          = "waaah"
  spec.version       = "0.1.1"
  spec.summary       = "Calculate pregnancy months from due date"
  spec.authors       = ["tadaaki"]
  spec.files         = Dir["lib/**/*.rb"] + ["bin/waaah"]
  spec.executables   = ["waaah"]
  spec.require_paths = ["lib"]
  spec.bindir        = "bin"
  spec.homepage      = "https://github.com/torinoko/waaah"
  spec.license       = "MIT"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/torinoko/waaah"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")
end
