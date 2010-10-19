module MicroSessions
  class MicroSession
    attr_accessor :param, :param_type, :length, :counter
    
    def initialize(options = {})
      options ||= {}
      options.stringify_keys!
      
      self.param = options[:param] || "_msid"
      self.key = options[:key] || "_micro_sessions"
      self.param_type = options[:param_type] || :hash
      self.length = options[:length] || 10
      self.counter = options[:counter] || 1
    end
    
    def data
      session[key][id] ||= {}
    end
    
    delegate :empty?, :[], :[]=, :to => :data
    
    def id
      @id ||= generate_id
    end
    
    
    protected
    
    def generate_id
      case param_type
      when :hash
        ActiveSupport::SecureRandom.hex(length)
      when :integer
        self.counter += 1
      when :random_integer
        ActiveSupport::SecureRandom.integer
      end
    end
  end
end
