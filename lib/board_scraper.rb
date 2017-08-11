require 'HTTParty'
require 'Nokogiri'
require_relative './search_criteria.rb'

class BoardScraper
  def initialize
    @search = SearchCriteria.new
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
    crafters = team_members.children.select do |member|
                member_title = member.css(@search.css_to_filter).text.downcase
                member_title.include? @search.filter_by_phrase and
                  !member_title.include? @search.exclude_by_phrase
              end
    crafter_names = crafters.map{ |member| member.css(@search.css_to_map).text }

    return crafter_names
  end
end
