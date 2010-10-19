unless defined?(ActionController)
  begin
    require 'action_pack'  
  rescue LoadError
    require 'rubygems'
    require_gem 'actionpack'
  end
end

require "micro_sessions/micro_session"
require "micro_sessions/middleware"
require "micro_sessions/version"
require "micro_sessions/railtie"