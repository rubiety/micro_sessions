module MicroSessions
  class MicroSession
    def initialize(controller)
      @controller = controller
    end
    
    def options
      @controller.class.micro_session_options
    end
    
    def data
      @controller.session[options[:key]] ||= {}
      @controller.session[options[:key]][id] ||= {}
    end
    
    delegate :empty?, :[], :[]=, :to_h, :to_hash, :to => :data
    
    def id
      @id ||= id_from_params || generate_id
    end
    
    
    protected
    
    def id_from_params
      @controller.params[options[:param]] if @controller.params
    end
    
    def generate_id
      case options[:param_type]
      when :hash
        ActiveSupport::SecureRandom.hex(options[:length] / 2)
      when :integer
        self.counter += 1
      when :random_integer
        ActiveSupport::SecureRandom.integer
      end
    end
  end
end
