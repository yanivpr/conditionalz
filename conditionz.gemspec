lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |s|
  s.name        = 'conditionz'
  s.version     = Conditionz::VERSION
  s.date        = '2014-04-01'
  s.summary     = "Semantic 'Design-By-Contract pre and post conditions'"
  s.description = "Assert pre-conditions and post-conditions inside methods"
  s.authors     = ["Yaniv Preiss"]
  s.email       = 'yanivpr@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = s.files.grep(%r{^(spec)/})
  s.homepage    = 'https://github.com/yanivpr/conditionz'
  s.license     = 'MIT'

  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "bundler", "~> 1.4"
  s.add_development_dependency "rake"
end