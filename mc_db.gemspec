$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mc_db/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mc_db"
  s.version     = McDb::VERSION
  s.authors     = ["NathanTheBook"]
  s.email       = ["book@email.org"]
  s.summary     = "Rails engine for minecraft related tasks related to the DynamicDatabase bukkit plugin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
end
