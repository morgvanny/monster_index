class MonsterIndex::Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("http://www.d20srd.org/indexes/monsters.htm"))
    monsters = []
    monsters
  end

  def self.scrape_monster_page(monster_url)
    doc = Nokogiri::HTML(open(monster_url))
    profile = {}
    profile
  end

end

