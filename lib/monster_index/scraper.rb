class MonsterIndex::Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("http://www.d20srd.org/indexes/monsters.htm"))
    monsters = []
    doc.search("ul.column li a").each do |monster|
      monsters << {
        name: monster.text,
        url: "http://www.d20srd.org#{monster.attr("href")}"
      }
    end
    monsters.delete_if do |monster|
      monster[:name] == "Aboleth Mage" ||
      monster[:name].include?("Archon") ||
      monster[:name].include?("Angel") ||
      monster[:name] == "Greater Barghest" ||
      monster[:name] == "Abyssal Greater Basilisk" ||
      monster[:url].include?("demon") ||
      monster[:url].include?("devil") ||
      monster[:url].include?("dinosaur") ||
      monster[:name] == "Dire Animal" ||
      monster[:url].include?("dragon") ||
      monster[:url].include?("dwarf") ||
      monster[:url].include?("elemental") ||
      monster[:url].include?("elf") ||
      monster[:url].include?("formian") ||
      monster[:url].include?("fungus") ||
      monster[:name] == "Kapoacinth" ||
      monster[:url].include?("genie") ||
      monster[:url].include?("ghoul") ||
      monster[:url].include?("giant") ||
      monster[:url].include?("gnome") ||
      monster[:url].include?("golem") ||
      monster[:url].include?("hag") ||
      monster[:url].include?("halfling") ||
      monster[:url].include?("harpy") ||
      monster[:url].include?("hellHound") ||
      monster[:url].include?("hydra") ||
      monster[:url].include?("inevitable") ||
      monster[:url].include?("lammasu") ||
      monster[:url].include?("lycanthrope") ||
      monster[:url].include?("mephit") ||
      monster[:url].include?("mummy") ||
      monster[:url].include?("naga") ||
      monster[:url].include?("nightmare") ||
      monster[:url].include?("nightshade") ||
      monster[:url].include?("ogre") ||
      monster[:url].include?("ooze") ||
      monster[:name].include?("Half") ||
      monster[:url].include?("planetouched") ||
      monster[:url].include?("sahuagin") ||
      monster[:name] == "Shadow" ||
      monster[:name] == "Greater Shadow" ||
      monster[:url].include?("sphinx") ||
      monster[:url].include?("sprite") ||
      monster[:url].include?("swarm") ||
      monster[:url].include?("troll") ||
      monster[:url].include?("unicorn") ||
      monster[:url].include?("vampire") ||
      monster[:url].include?("wraith") ||
      monster[:url].include?("horse") ||
      monster[:url].include?("snake") ||
      monster[:url].include?("whale")
    end
    monsters
  end

  def self.scrape_monster_page(monster_url)
    doc = Nokogiri::HTML(open(monster_url))
    profile = {
      size_type: doc.search("table tr td")[0].text,
      hit_dice: doc.search("table tr td")[1].text,
      initiative: doc.search("table tr td")[2].text,
      speed: doc.search("table tr td")[3].text,
      ac: doc.search("table tr td")[4].text,
      attack: doc.search("table tr td")[7].text,
      alignment: doc.search("table tr td")[19].text,
      }
    profile
  end

end

