require 'grimm/book'

module Grimm
  module Dsl
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def book(*args, &block)
        Grimm::Book.new(*args, &block)
      end
    end
  end
end
