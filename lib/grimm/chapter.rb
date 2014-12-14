module Grimm
  class Chapter
    attr_reader :title

    def initialize(title, &block)
      @title = title

      self.instance_eval(&block) if block_given?
    end
  end
end
