module MicroSessions
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer "micro_sessions.insert" do
        ActiveSupport.on_load(:action_controller) do
          MicroSessions::Railtie.insert
        end
      end
    end
  end
  
  class Railtie
    def self.insert
      ActionController::Base.send(:include, MicroSessions::Controller)
      ActionView::Helpers::UrlHelper.send(:include, MicroSessions::Helpers::UrlHelper)
      ActionView::Helpers::FormTagHelper.send(:include, MicroSessions::Helpers::FormTagHelper)
    end
  end
end
