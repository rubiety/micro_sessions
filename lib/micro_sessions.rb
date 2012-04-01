require "rails"
require "action_controller"
require "action_view"

module MicroSessions
  extend ActiveSupport::Concern
  extend ActiveSupport::Autoload
  
  autoload :Controller
  autoload :Helpers
  autoload :MicroSession
  
  included do
    include MicroSessions::Controller
  end
end

require "micro_sessions/railtie"
