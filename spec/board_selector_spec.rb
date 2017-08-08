require_relative '../lib/board_selector.rb'

describe BoardSelector do
  crafters = ['Peter', 'Paul', 'Mary', 'Bill', 'Nancy']
  requested_number = 3

  selector = BoardSelector.new(crafters, requested_number)

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
    short_crafters = ['Fred']
    short_selector = BoardSelector.new(short_crafters, requested_number)

    # it 'throws an error if crafter list is too short' do
    #   expect(short_selector.crafters_list_is_long_enough, 'Crafter list is too short.').to raise_error('Crafter list is too short.')
    # end

    it 'returns true if list is long enough' do
      expect(selector.crafters_list_is_long_enough).to eql(true)
    end
  end

  describe 'select_crafters' do
    it 'returns an empty array' do
      expect(selector.select_crafters).to eql([])
    end
  end
end
