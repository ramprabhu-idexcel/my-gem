$:.push File.expand_path("../lib", __FILE__)

require "mygem/version"

Gem::Specification.new do |s|
  s.name        = "mygem"  
  s.authors     = ["Ramprabhu"]
  s.version     = Mygem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.email       = ["nramprabu@gmail.com"]
  s.summary     = %q{Common Models between Master and MyAdmin.}
  s.description = %q{Common Models between Master and MyAdmin.}
  s.homepage    = "https://github.com/ramprabhu-idexcel/my-gem"
  s.license     = "Ram Proprietary"

  s.files = Dir["{config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]
  s.add_dependency("rails", "~> 5.0.1")
  s.add_development_dependency "bundler"
  s.require_paths = ["lib"]
end
