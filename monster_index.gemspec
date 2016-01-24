# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monster_index/version'

Gem::Specification.new do |spec|
  spec.name          = "monster_index"
  spec.version       = MonsterIndex::VERSION
  spec.authors       = ["Morgan VanYperen"]
  spec.email         = ["morgvanny@gmail.com"]

  spec.summary       = "Quick reference for monsters in D&D 3.5 edition."
  spec.description   = %q{See a list of monsters, and important stats on each of them. Scraped from http://www.d20srd.org/}
  spec.homepage      = "https://github.com/morgvanny/monster_index"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #end

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["monster_index"]
  spec.require_paths = ["lib", "lib/monster_index"]
  spec.name          = "monster_index"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
