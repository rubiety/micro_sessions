module MicroSession
  module Helpers
    extend ActiveSupport::Concern
    
    module InstanceMethods
      def url_for(options = {})
        if options.is_a?(Hash) && ms_value = options.delete(:micro_sessions) && !micro_session.empty?
          options[micro_session.param] = (ms_value == true ? micro_session.id : ms_value)
        end
        
        super
      end
    end
  end
end
