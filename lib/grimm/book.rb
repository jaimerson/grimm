module Grimm
  class Book
    attr_reader :hero
    alias_method :heroine, :hero

    def initialize(title=nil, &block)
      @title = title

      self.instance_eval(&block) if block_given?
    end

    def title(new_title=nil)
      @title ||= new_title
    end

    def define_hero(name=nil, &block)
      if name
        alias_method name, :hero
      end
      @hero = Grimm::Hero.new(name, &block)
    end

  end
end
