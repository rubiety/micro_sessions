module MicroSessions
  class Railtie < Rails::Railtie
    initializer "micro_sessions.insert" do
      ActiveSupport.on_load(:action_controller) do
        MicroSessions::Railtie.insert_controller
      end

      ActiveSupport.on_load(:action_view) do
        MicroSessions::Railtie.insert_view
      end
    end

    def self.insert_controller
      ActionController::Base.send(:include, MicroSessions::Controller)
      ActionController::Base.send(:include, MicroSessions::Helpers::UrlHelper)
    end

    def self.insert_view
      ActionView::Helpers::FormTagHelper.send(:include, MicroSessions::Helpers::FormTagHelper)
      ActionView::Helpers::UrlHelper.send(:include, MicroSessions::Helpers::UrlHelper)
    end

    MicroSessions::Railtie.insert_controller
    MicroSessions::Railtie.insert_view

    config.after_initialize do
      MicroSessions::Railtie.insert_controller
      MicroSessions::Railtie.insert_view
    end
  end
end

