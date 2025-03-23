require_relative 'lib/rumble_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "rumble_tools"
  spec.version       = RumbleTools::VERSION
  spec.authors       = ["Derek Neighbors"]
  spec.email         = ["dneighbo@gmail.com"]

  spec.summary       = "A lightweight toolkit for parsing and managing Warcraft Rumble loadouts"
  spec.description   = "A Ruby gem for creating, parsing, and managing Warcraft Rumble loadouts"
  spec.homepage      = "https://github.com/dneighbors/rumble_tools"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0", "< 4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  spec.files         = Dir.glob("{bin,lib}/**/*") + %w[LICENSE README.md]
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "base64", "~> 0.1"
  
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 13.0"
end 