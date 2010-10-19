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
      ActionView::Helpers::UrlHelper.include(MicroSessions::Helpers)
    end
  end
end
