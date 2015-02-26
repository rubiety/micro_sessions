# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'micro_sessions/version'

Gem::Specification.new do |spec|
  spec.name        = 'micro_sessions'
  spec.version     = MicroSessions::VERSION
  spec.author      = 'Ben Hughes'
  spec.email       = 'ben@railsgarden.com'
  spec.homepage    = 'http://github.com/rubiety/micro_sessions'
  spec.summary     = 'Keyed sessions within the global sessions object.'
  spec.description = "Provides 'micro-sessions' within the global sessions object keyed off an identifier."

  spec.files        = Dir['{lib,spec}/**/*', '[A-Z]*']
  spec.require_path = %w(lib)

  spec.required_ruby_version = '>= 1.8.7'
  spec.required_rubygems_version = '>= 1.3.5'

  spec.add_dependency 'rails', ['>= 3.0.0', '<= 4.1.1']
end
