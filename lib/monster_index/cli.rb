class MonsterIndex::CLI

  def call
    start
  end

  def start
    puts "Welcome to Monster Index!"
    puts "Loading monsters..."
    make_monsters
    options
  end

  def make_monsters
    monster_array = MonsterIndex::Scraper.scrape_index_page
    MonsterIndex::Monster.create_from_collection(monster_array)
    MonsterIndex::Monster.all.each do |monster|
      attributes_hash = MonsterIndex::Scraper.scrape_monster_page(monster.url)
      monster.add_monster_attributes(attributes_hash)
    end
  end

  def options
    input = ""
    while input != "exit"
      puts "Type list to see them all, type any letter to see the monsters starting"
      puts "with that letter, type the name of a monster to see details, or type exit."
      input = gets.strip
      if input.downcase == "list"
        MonsterIndex::Monster.list
      elsif input.match(/\A[a-zA-Z]\z/)
        MonsterIndex::Monster.list_some(input)
      elsif MonsterIndex::Monster.get_names.any? {|name| name == input}
        MonsterIndex::Monster.view_profile(input)
      end
    end
  end

end