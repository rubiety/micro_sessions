# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "micro_sessions/version"

Gem::Specification.new do |s|
  s.name        = "micro_sessions"
  s.version     = MicroSessions::VERSION
  s.author      = "Ben Hughes"
  s.email       = "ben@railsgarden.com"
  s.homepage    = "http://github.com/rubiety/micro_sessions"
  s.summary     = "Keyed sessions within the global sessions object."
  s.description = "Provides 'micro-sessions' within the global sessions object keyed off an identifier."
  
  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"]
  s.require_path = "lib"
  
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
  
  s.add_dependency("rails", ["~> 3.0.0"])
  s.add_development_dependency("rspec", ["~> 2.0"])
  s.add_development_dependency("cucumber", ["~> 1.0.4"])
  s.add_development_dependency("capybara", ["~> 1.1.0"])
  s.add_development_dependency("sqlite3", ["~> 1.3.4"])
  s.add_development_dependency('appraisal', ["~> 0.4.0"])
  s.add_development_dependency("rdoc", ["~> 3.12"])
  s.add_development_dependency "rake"
end
