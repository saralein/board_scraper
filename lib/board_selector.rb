require_relative './board_scraper.rb'

class BoardSelector
  def initialize(requested_number, crafter_list)
    @crafters = crafter_list
    @requested_number = requested_number
  end

  def generate_random_numbers
    random_numbers = Set.new []

    while (random_numbers.length != @requested_number)
      number = rand(@crafters.length)
      random_numbers.add(number)
    end

    return random_numbers.to_a
  end

  def crafters_list_is_long_enough
    return @crafters.length >= @requested_number
  end

  def select_crafters
    if (crafters_list_is_long_enough)
      numbers = generate_random_numbers
      return numbers.map{ |number| @crafters[number] }
    else
      puts "Crafter list is too short (#{@crafters.length} members):"
      return @crafters
    end
  end

  def display_crafters
    select_crafters.each{ |crafter| puts crafter }
  end
end
