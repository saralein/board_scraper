require 'HTTParty'
require 'Nokogiri'

class BoardScraper
  def initialize(url, css_selector)
    @url = url
    @css_selector = css_selector
  end

  def parse_html()
    begin
      doc = HTTParty.get(@url)
    rescue HTTParty::Error => error
      puts error.inspect
    rescue => error
      puts error.inspect
    else
      return Nokogiri::HTML(doc)
    end
  end

  def get_crafters()
    team_members = parse_html.css(@css_selector)
    return team_members.children
      .select{ |member| member.css('.team_member-title').text.downcase.include? 'software' }
      .map{ |member| member.css('.team_member-name').text }
  end
end
