require_relative '../lib/board_selector.rb'
require_relative '../lib/board_scraper.rb'

describe BoardSelector do
  crafters = ['Peter', 'Paul', 'Mary', 'Bill', 'Nancy']
  short_crafters = ['Fred', 'George']
  url = 'https://8thlight.com/team/'
  css_selector = '.team_gallery'
  requested_number = 3

  describe 'generate_random_numbers' do
    selector = BoardSelector.new(url, css_selector, requested_number)
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
      allow_any_instance_of(BoardScraper).to receive(:get_crafters).and_return(short_crafters)
      short_selector = BoardSelector.new(url, css_selector, requested_number)
      expect(short_selector.crafters_list_is_long_enough).to eql(false)
    end

    it 'returns true if list is long enough' do
      allow_any_instance_of(BoardScraper).to receive(:get_crafters).and_return(crafters)
      selector = BoardSelector.new(url, css_selector, requested_number)
      expect(selector.crafters_list_is_long_enough).to eql(true)
    end
  end

  describe 'select_crafters' do
    it 'returns an array of three crafters' do
      allow_any_instance_of(BoardScraper).to receive(:get_crafters).and_return(crafters)
      selector = BoardSelector.new(url, css_selector, requested_number)
      allow(selector).to receive(:generate_random_numbers).and_return([1, 2, 3])
      expect(selector.select_crafters).to eql(['Paul', 'Mary', 'Bill'])
    end

    it 'returns an array of three different crafters' do
      allow_any_instance_of(BoardScraper).to receive(:get_crafters).and_return(crafters)
      selector = BoardSelector.new(url, css_selector, requested_number)
      allow(selector).to receive(:generate_random_numbers).and_return([0, 3, 4])
      expect(selector.select_crafters).to eql(['Peter', 'Bill', 'Nancy'])
    end

    it 'return original crafters list if list is too short' do
      allow_any_instance_of(BoardScraper).to receive(:get_crafters).and_return(short_crafters)
      short_selector = BoardSelector.new(url, css_selector, requested_number)
      expect(short_selector.select_crafters).to eql(short_crafters)
    end
  end

  describe 'display_crafters' do
    it 'calls puts requested_number times' do
      selector = BoardSelector.new(url, css_selector, requested_number)
      allow(selector).to receive(:select_crafters).and_return(['Peter', 'Bill', 'Nancy'])
      expect(STDOUT).to receive(:puts).with('Peter').ordered
      expect(STDOUT).to receive(:puts).with('Bill').ordered
      expect(STDOUT).to receive(:puts).with('Nancy').ordered
      selector.display_crafters
    end
  end
end
