class MonsterIndex::Monster
  attr_accessors :name, :bio, :attack, :hp, :alignment, :initiative, :speed, :ac, :size_type

  @@all = []

  def initialize(monster_hash)
    monster_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(monster_array)
    monster_array.each do |monster_hash|
      self.new(monster_hash)
    end
  end

  def self.list
    @@all.each do |monster|
      puts "#{monster.name}"
    end
  end

  def view_profile

  end

end