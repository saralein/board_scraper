class BoardSelector
  def initialize(crafters, requested_number)
    @crafters = crafters
    @requested_number = requested_number
  end

  def generate_random_numbers
    random_numbers = Hash.new(0)

    while (random_numbers.length != @requested_number)
      number = 1 + rand(6)
      if (!random_numbers.key?(number))
        random_numbers[number] = number
      end
    end

    return random_numbers.keys
  end

  def crafters_list_is_long_enough
    if (@crafters.length < @requested_number)
      # throw Error.new('Crafter list is too short.')
      raise 'Crafter list is too short.'
    else
      return true
    end
  end

  def select_crafters
    return []
  end
end
