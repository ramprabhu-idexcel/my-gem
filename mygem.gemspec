$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "mygem"  
  s.authors     = ["Ramprabhu"]
  s.email       = ["nramprabu@gmail.com"]
  s.summary     = %q{Common Models between Master and MyAdmin.}
  s.description = %q{Common Models between Master and MyAdmin.}
  s.homepage    = "https://github.com/ramprabhu-idexcel/my-gem"
  s.license     = "Ram Proprietary"

  s.files = Dir["{config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency("rails", "~> 5.0.1")
  s.add_dependency('activerecord', '~> 5.0.1')
  s.add_dependency('squeel')
  s.add_dependency('validates_email_format_of')

  s.add_development_dependency "bundler"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "ffaker"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", '~>3.2'
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'shoulda'
  s.add_development_dependency "valid_attribute"
end
