require_relative '../lib/board_scraper.rb'

describe BoardScraper do
  scraper = BoardScraper.new
  response = '<div class="content team_gallery">
              <div class="team_member">
              <img class="team_member-photo" src="/images/team/aaron-lahey-4390ac4a.jpg" alt="Aaron Lahey, Software Crafter | 8th Light"><h3 class="team_member-name">Aaron Lahey</h3>
              <p class="team_member-title">Software Crafter</p>
              </div>
              <div class="team_member">
              <img class="team_member-photo" src="/images/team/aina-pinto-421b8b4b.jpg" alt="Aina Pinto, Software Crafter | 8th Light"><h3 class="team_member-name">Aina Pinto</h3>
              <p class="team_member-title">Software Crafter</p>
              </div>
              <div class="team_member">
              <img class="team_member-photo" src="/images/team/amelia-suchy-7b504935.jpg" alt="Amelia Suchy, Office Management | 8th Light"><h3 class="team_member-name">Amelia Suchy</h3>
              <p class="team_member-title">Office Management</p>
              </div>
              <div class="team_member">
              <img class="team_member-photo" src="/images/team/anda-cabrera-7229d582.jpg" alt="Anda Cabrera, Software Crafter | 8th Light"><h3 class="team_member-name">Anda Cabrera</h3>
              <p class="team_member-title">Software Crafter</p>
              </div>
              </div></div>'

  describe 'parse_html' do
    it 'returns a Nokogiri::HTML::Document' do
      expect(scraper.parse_html).to be_kind_of(Nokogiri::HTML::Document)
    end
  end

  describe 'get_crafters' do
    it 'returns an array of crafters' do
      expect(scraper).to receive(:parse_html).and_return(Nokogiri::HTML(response))
      expect(scraper.get_crafters).to eql(['Aaron Lahey', 'Aina Pinto', 'Anda Cabrera'])
    end
  end
end
