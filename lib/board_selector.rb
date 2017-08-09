require_relative './board_scraper.rb'

class BoardSelector
  attr_accessor :crafters

  def initialize(url, selector, requested_number)
    @crafters = BoardScraper.new(url, selector).get_crafters
    @requested_number = requested_number
  end

  def generate_random_numbers
    random_numbers = Hash.new(0)

    while (random_numbers.length != @requested_number)
      number = rand(@crafters.length)
      if (!random_numbers.key?(number))
        random_numbers[number] = number
      end
    end

    return random_numbers.keys
  end

  def crafters_list_is_long_enough
    return @crafters.length >= @requested_number
  end

  def select_crafters
    if (crafters_list_is_long_enough)
      numbers = generate_random_numbers
      return numbers.map{ |number| @crafters[number]}
    else
      raise 'Crafter list is too short.'
      return @crafters
    end
  end

  def display_crafters
    select_crafters.each{ |crafter| puts crafter }
  end
end
