require 'bundler/setup'
require './lib/board_selector.rb'
Bundler.require

BoardSelector
  .new('https://8thlight.com/team/', '.team_gallery', 6)
  .display_crafters
