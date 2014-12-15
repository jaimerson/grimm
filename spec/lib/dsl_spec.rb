require 'spec_helper'

describe Grimm::Dsl do
  subject(:descendant) do
    Class.new do
      include Grimm::Dsl
    end
  end

  describe '.book' do
    it 'creates a book' do
      expect(descendant.book).to be_a(Grimm::Book)
    end

    it 'sets the book title' do
      book = descendant.book 'The never ending story'
      expect(book.title).to eq('The never ending story')
    end

    it 'evaluates the given block in the book\'s context' do
      book = descendant.book do
        title 'Hakuna matata'
      end
      expect(book.title).to eq('Hakuna matata')
    end
  end
end
