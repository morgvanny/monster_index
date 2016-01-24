class MonsterIndex::Monster
  attr_accessor :name, :bio, :size_type, :hit_dice, :initiative, :speed, :ac, :attack, :alignment, :url

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
  end

  def self.list_some(letter)
    @@all.each do |monster|
      if monster.name.downcase.match(/\A[#{letter.downcase}]/)
        puts "#{monster.name}"
      end
    end
  end

  def self.view_profile(name)
    puts "Description:"
    puts "#{bio}\n"
    puts "Size/Type: #{size_type}"
    puts "Hit Dice: #{hit_dice}"
    puts "Initiative: #{initiative}"
    puts "Speed: #{speed}"
    puts "AC: #{ac}"
    puts "Attack: #{attack}"
    puts "Alignment: #{alignment}"
    puts "More info at: #{url}"
  end

  def self.all
    @@all
  end

end