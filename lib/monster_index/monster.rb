class MonsterIndex::Monster
  attr_accessor :name, :size_type, :hit_dice, :initiative, :speed, :ac, :attack, :alignment, :url

  @@all = []

  def initialize(monster_hash = {})
    monster_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(monster_array)
    monster_array.each do |monster_hash|
      self.new(monster_hash)
    end
  end

  def add_monster_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.get_names
    names = []
    @@all.each do |monster|
      names << monster.name
    end
    names
  end

  def self.list
    @@all.each do |monster|
      puts "#{monster.name}"
    end
    puts
  end

  def self.list_some(letter)
    @@all.each do |monster|
      if monster.name.downcase.match(/\A[#{letter.downcase}]/)
        puts "#{monster.name}"
      end
    end
    puts
  end

  def self.view_profile(name)
    monster = @@all.find {|one| one.name == name}
    puts "Size/Type: #{monster.size_type}"
    puts "Hit Dice: #{monster.hit_dice}"
    puts "Initiative: #{monster.initiative}"
    puts "Speed: #{monster.speed}"
    puts "AC: #{monster.ac}"
    puts "Attack: #{monster.attack}"
    puts "Alignment: #{monster.alignment}"
    puts "More info at: #{monster.url}"
    puts
  end

  def self.get_monster(name)
    @@all.find {|one| one.name == name}
  end

  def self.all
    @@all
  end

end