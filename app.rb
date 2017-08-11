require 'bundler/setup'
require './lib/board_scraper.rb'
require './lib/board_selector.rb'
Bundler.require

def pick_review_board
  begin
    print 'How many crafters would you like on the board? '
    number_of_crafters = Integer(gets.chomp)
  rescue
    puts 'Please enter an interger.'
    retry
  end

  selector = BoardSelector.new(number_of_crafters, BoardScraper.new.get_crafters)

  begin
    board = selector.select_crafters
    board.each{ |crafter| puts crafter }
  rescue => error
    puts error
  end
end

pick_review_board
