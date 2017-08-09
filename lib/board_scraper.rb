require 'HTTParty'
require 'Nokogiri'
require_relative './search.rb'

class BoardScraper
  def initialize
    @search = Search.new
  end

  def parse_html
    begin
      doc = HTTParty.get(@search.url)
    rescue HTTParty::Error => error
      puts error.inspect
    rescue => error
      puts error.inspect
    else
      return Nokogiri::HTML(doc)
    end
  end

  def get_crafters
    team_members = parse_html.css(@search.css_selector)
    return team_members.children
      .select{ |member| member.css(@search.css_to_filter).text.downcase.include? @search.filter_by_phrase }
      .map{ |member| member.css(@search.css_to_map).text }
  end
end
