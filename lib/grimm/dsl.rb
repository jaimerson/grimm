module Grimm
  module Dsl
    def book(*args, &block)
      @book ||= Grimm::Book.new(*args, &block)
    end
  end
end
