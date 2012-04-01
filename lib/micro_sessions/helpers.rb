module MicroSessions
  module Helpers
    module UrlHelper
      extend ActiveSupport::Concern

      def url_for(options = {})
        if options.is_a?(Hash) && ms_value = options.delete(:micro_sessions) && !micro_session.empty?
          options[micro_session.options[:param]] = (ms_value == true ? micro_session.id : ms_value)
        end
      
        super
      end
    end
    
    module FormTagHelper
      extend ActiveSupport::Concern
      
      def micro_session_hidden_field
        hidden_field_tag controller.class.micro_session_options[:param], micro_session.id
      end
    end
  end
end
