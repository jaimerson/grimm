module Grimm
  class Hero
    def initialize(name, &block)
      @name = name
      self.instance_eval(&block) if block_given?
    end

    def method_missing?(method_name, *args, &block)
      define_method(method_name) do |*args|
        if value = instance_variable_get("@#{method_name}")
          value
        else
          instance_variable_set("@#{method_name}", args.first)
        end
      end
    end

    def respond_to_missing?
      true
    end
  end
end
