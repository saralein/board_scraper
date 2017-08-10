require_relative '../lib/board_selector.rb'
require_relative '../lib/board_scraper.rb'

describe BoardSelector do
  crafters = ['Peter', 'Paul', 'Mary', 'Bill', 'Nancy']
  short_crafters = ['Fred', 'George']
  requested_number = 3
  selector = BoardSelector.new(requested_number, crafters)
  short_selector = BoardSelector.new(requested_number, short_crafters)

  describe 'generate_random_numbers' do
    numbers = selector.generate_random_numbers

    it 'returns an array of desired length' do
      expect(numbers.length).to eql(3)
    end

    it 'returns an array of unique elements' do
      expect(numbers).to eql(numbers.uniq)
    end
  end

  describe 'crafters_list_is_long_enough' do
    it 'returns false if list is too short' do
      expect(short_selector.crafters_list_is_long_enough).to eql(false)
    end

    it 'returns true if list is long enough' do
      expect(selector.crafters_list_is_long_enough).to eql(true)
    end
  end

  describe 'select_crafters' do
    it 'returns an array of three crafters' do
      allow(selector).to receive(:generate_random_numbers).and_return([1, 2, 3])
      expect(selector.select_crafters).to eql(['Paul', 'Mary', 'Bill'])
    end

    it 'returns an array of three different crafters' do
      allow(selector).to receive(:generate_random_numbers).and_return([0, 3, 4])
      expect(selector.select_crafters).to eql(['Peter', 'Bill', 'Nancy'])
    end

    it 'returns original crafters list if list is too short' do
      expect(STDOUT).to receive(:puts).with("Crafter list is too short (2 members):")
      expect(short_selector.select_crafters).to eql(short_crafters)
    end
  end

  describe 'display_crafters' do
    it 'calls puts requested_number times' do
      allow(selector).to receive(:select_crafters).and_return(['Peter', 'Bill', 'Nancy'])
      expect(STDOUT).to receive(:puts).with('Peter').ordered
      expect(STDOUT).to receive(:puts).with('Bill').ordered
      expect(STDOUT).to receive(:puts).with('Nancy').ordered
      selector.display_crafters
    end
  end
end
