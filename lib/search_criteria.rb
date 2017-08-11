class SearchCriteria
  attr_accessor :url, :css_selector, :css_to_filter, :filter_by_phrase, :exclude_by_phrase, :css_to_map

  def initialize
    @url = 'https://8thlight.com/team/'
    @css_selector = '.team_gallery'
    @css_to_filter = '.team_member-title'
    @filter_by_phrase = 'software'
    @exclude_by_phrase = 'director'
    @css_to_map = '.team_member-name'
  end
end
