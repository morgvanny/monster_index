require 'spec_helper'

describe MonsterIndex do
  it 'has a version number' do
    expect(MonsterIndex::VERSION).not_to be nil
  end

  describe MonsterIndex::CLI do
    let(:cli) { MonsterIndex::CLI.new }

    it 'initializes without error' do
      expect { cli }.not_to raise_error
    end

    it 'responds to #call method' do
      expect(cli).to respond_to(:call)
    end
  end

  describe MonsterIndex::Monster do
    let(:monster_data) { { name: 'Goblin', url: 'http://example.com/goblin' } }
    let(:monster) { MonsterIndex::Monster.new(monster_data) }

    it 'initializes with a hash of attributes' do
      expect(monster.name).to eq('Goblin')
      expect(monster.url).to eq('http://example.com/goblin')
    end

    it 'adds to @@all when initialized' do
      expect { MonsterIndex::Monster.new(monster_data) }.to change { MonsterIndex::Monster.all.count }.by(1)
    end

    describe '.create_from_collection' do
      it 'creates multiple monsters from an array of hashes' do
        data = [
          { name: 'Orc', url: 'http://example.com/orc' },
          { name: 'Troll', url: 'http://example.com/troll' }
        ]
        expect { MonsterIndex::Monster.create_from_collection(data) }.to change { MonsterIndex::Monster.all.count }.by(2)
      end
    end

    describe '.get_names' do
      it 'returns an array of all monster names' do
        MonsterIndex::Monster.create_from_collection([
          { name: 'Orc', url: 'http://example.com/orc' },
          { name: 'Troll', url: 'http://example.com/troll' }
        ])
        expect(MonsterIndex::Monster.get_names).to include('Orc', 'Troll')
      end
    end
  end

  describe MonsterIndex::Scraper do
    describe '.scrape_index_page' do
      it 'returns an array of monster hashes' do
        VCR.use_cassette('monster_index_page') do
          monsters = MonsterIndex::Scraper.scrape_index_page
          expect(monsters).to be_an(Array)
          expect(monsters.first).to include(:name, :url)
        end
      end
    end

    describe '.scrape_monster_page' do
      it 'returns a hash of monster attributes' do
        VCR.use_cassette('monster_page') do
          attributes = MonsterIndex::Scraper.scrape_monster_page('http://www.d20srd.org/srd/monsters/aboleth.htm')
          expect(attributes).to include(:size_type, :hit_dice, :initiative, :speed, :ac, :attack, :alignment)
        end
      end
    end
  end
end
