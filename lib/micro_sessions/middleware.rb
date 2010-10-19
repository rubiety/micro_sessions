module MicroSessions
  class Middleware < ActionController::Middleware
    def micro_session
      @micro_session ||= MicroSessions::MicroSession.new
    end
  end
end
