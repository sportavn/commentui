$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "commentui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "commentui"
  s.version     = Commentui::VERSION
  s.authors     = ["Phuoc Phan"]
  s.email       = ["phanphuocdt@gmail.com"]
  s.homepage    = "https://github.com/sportavn/commentui/"
  s.summary     = "A simple comment API gem"
  s.description = "Allow user to post comment to your models by APIs"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency "pagy", "~> 3.6.0"

  s.add_development_dependency "rspec-rails", "~> 3.9"
  s.add_development_dependency "database_cleaner", "~> 1.7"
  s.add_development_dependency "simplecov", "~> 0.17.1"
  s.add_development_dependency "pg", "~> 0.18.4"
  s.add_development_dependency "pry-rails", "~> 0.3.9"
  s.add_development_dependency "puma", "~> 4.2.1"
  s.add_development_dependency "dotenv-rails", "~> 2.7.5"
  s.add_development_dependency "factory_bot_rails", "~> 5.1.1"
  s.add_development_dependency "faker", "~> 2.6"
end
