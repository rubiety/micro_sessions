module MicroSessions
  class Railtie < Rails::Railtie
    initializer "micro_sessions.configure_view_controller" do
      ActiveSupport.on_load(:action_controller) do
        include MicroSessions::Controller
        include MicroSessions::Helpers::UrlHelper
      end

      ActiveSupport.on_load(:action_view) do
        include MicroSessions::Helpers::FormTagHelper
        include MicroSessions::Helpers::UrlHelper
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
  end
end
