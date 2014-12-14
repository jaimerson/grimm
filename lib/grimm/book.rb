require 'grimm/chapter'

module Grimm
  class Book
    attr_reader :chapters

    def initialize(title=nil, &block)
      @title = title
      @chapters = []

      self.instance_eval(&block) if block_given?
    end

    def title(new_title=nil)
      @title ||= new_title
    end

    def chapter(title, &block)
      @chapters << Chapter.new(title, &block)
    end
  end
end
