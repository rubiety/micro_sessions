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
      @controller.session[options[:key]][id].symbolize_keys!
    end

    def url_options
      if empty?
        {}
      else
        {options[:param] => id}
      end
    end

    delegate :empty?, :[], :[]=, :to_h, :to_hash, :inspect, :to => :data

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
        (Object::const_defined?("SecureRandom") ? SecureRandom : ActiveSupport::SecureRandom).hex(options[:length] / 2)
      when :integer
        self.counter += 1
      when :random_integer
        (Object::const_defined?("SecureRandom") ? SecureRandom : ActiveSupport::SecureRandom).integer
      end
    end
  end
end
