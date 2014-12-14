require 'grimm/dsl'

module Grimm
  class StoryTeller
    include Grimm::Dsl

    def initialize(input_stream=$stdin, &block)
      @input_stream = input_stream

      self.instance_eval(&block) if block_given?
    end

    def scenario(description)
      binding.pry
    end

    private

    def user_input
      @input_stream.gets
    end
  end
end
