module MicroSessions
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def micro_sessions(options = {})
        options.stringify_keys!
        options.assert_valid_keys(:param, :param_type, :key, :length, :counter)

        options[:param] ||= "_msid"
        options[:key] ||= "_micro_sessions"
        options[:param_type] ||= :hash
        options[:length] ||= 10
        options[:counter] ||= 1

        class_attribute :micro_session_options
        self.micro_session_options = options

        class_eval do
          def micro_session
            @micro_session ||= MicroSessions::MicroSession.new(self)
          end

          helper_method :micro_session
          helper_method :micro_session_options
        end
      end
    end
  end
end
