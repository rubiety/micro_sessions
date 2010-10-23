module MicroSessions
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer "micro_sessions.insert" do
        ActiveRecord::MicroSessions::Railtie.insert
      end
    end
  end
  
  class Railtie
    def self.insert
      ActionController::Base.send(:include, MicroSessions)
      ActionView::Helpers::UrlHelper.send(:include, MicroSessions::Helpers::UrlHelper)
      ActionView::Helpers::FormTagHelper.send(:include, MicroSessions::Helpers::FormTagHelper)
    end
  end
end
