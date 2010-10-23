unless defined?(ActionController)
  begin
    require "action_pack"  
    require "action_controller"
    require "action_view"
  rescue LoadError
    require "rubygems"
    require_gem "actionpack"
  end
end

module MicroSessions
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload
  
  autoload :Controller
  autoload :Helpers
  autoload :MicroSession
  autoload :Railtie
  
  included do
    include MicroSessions::Controller
  end
end