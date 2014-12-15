module Grimm
  class StoryTeller
    include Grimm::Dsl

    def initialize(input_stream=$stdin, &block)
      @input_stream = input_stream

      self.instance_eval(&block) if block_given?
    end

    def start
      while !book.finished
        print_instructions
        book.public_send(formatted_user_input)
      end
    end

    private

    def print_instructions
      puts book.current_chapter
      puts 'What do you do?'
    end

    def formatted_user_input
      user_input.chomp
        .gsub(/\s/, '_')
    end

    def user_input
      @input_stream.gets
    end
  end
end
