module Grimm
  class Book
    attr_reader :finished

    def initialize(title=nil, &block)
      @title = title
      @chapters = []

      self.instance_eval(&block) if block_given?
    end

    def title(new_title=nil)
      @title ||= new_title
    end

    def hero(&block)
      @hero ||= Grimm::Hero.new(&block)
    end
    alias_method :heroine, :hero

    def scenario(name, *args, &block)
      self.class.class_eval do
        define_method(name, &block)
        args.each do |arg|
          alias_method arg, name
        end
      end
    end

    def chapter(description)
      @chapters << description
    end
    alias_method :prologue, :chapter

    def current_chapter
      @chapters.first
    end

    def finish(message)
      puts message
      @finished = true
    end

    def go_back(message)
      puts message
    end

    def method_missing(method_name, *args, &block)
      puts "Dont't know how to #{method_name}."
    end

  end
end
