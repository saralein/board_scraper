require 'bundler/setup'
require './lib/board_selector.rb'
Bundler.require

BoardSelector
  .new(6)
  .display_crafters
