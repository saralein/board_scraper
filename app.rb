require 'bundler/setup'
require './lib/board_scraper.rb'
require './lib/board_selector.rb'
Bundler.require

def pick_review_board(number_of_crafters)
  BoardSelector
    .new(number_of_crafters, BoardScraper.new.get_crafters)
    .display_crafters
end

pick_review_board(6)
