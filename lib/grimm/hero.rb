module Grimm
  class Hero
    def initialize(&block)
      self.instance_eval(&block) if block_given?
    end

    def method_missing(method_name, *args, &block)
      super if !!(method_name =~ /\?\z/)

      self.class.class_eval do
        define_method("#{method_name}?") do |*args|
          unless args.empty?
            instance_variable_set("@#{method_name}", args.first)
          end

          instance_variable_get("@#{method_name}")
        end
      end
    end

    def respond_to_missing?
      true
    end
  end
end
