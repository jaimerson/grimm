require 'spec_helper'
require 'grimm/book'

describe Grimm::Book do
  describe '#chapter' do
    subject(:book) do
      described_class.new 'The Dark Tower: The gunslinger' do
        chapter 'The gunslinger'
        chapter 'The way station'
        chapter 'The oracle and the mountains'
      end
    end

    it 'creates the chapters' do
      expect(book.chapters.count).to eq(3)
    end

    it 'adds chapters to the book' do
      expect(book.chapters.first.title)
        .to eq('The gunslinger')
    end
  end
end
