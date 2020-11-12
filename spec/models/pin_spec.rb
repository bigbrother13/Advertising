require 'rails_helper'

RSpec.describe Pin, :type => :model do
  let!(:tag1) { Tag.create(name: 'tag1') }
  let!(:tag2) { Tag.create(name: 'tag2') }

  let!(:pin1) { Pin.create(title: 'pin1') }
  let!(:pin2) { Pin.create(title: 'pin2') }

  context 'validations' do
    it "is valid with valid attributes" do
      pin = Pin.new(image_content_type: 'image/')
      expect(pin).to be_valid
    end

    it "is not valid with invalida image type" do
      pin = Pin.new(image_content_type: 'css')
      expect(pin).to_not be_valid
    end
  end

  context '#search' do
    it "returns all pins" do
      expect(Pin.search('')).to include(pin1)
      expect(Pin.search('')).to include(pin2)
    end

    it "returns only pin1" do
      expect(Pin.search('pin1')).to include(pin1)
      expect(Pin.search('pin1')).not_to include(pin2)
    end

    it "returns nothing" do
      expect(Pin.search('wOOOOP')).not_to include(pin1)
      expect(Pin.search('wOOOOP')).not_to include(pin2)
    end
  end

  context '#all_tags' do
    before do
      pin1.tags << tag1
      pin1.tags << tag2
    end
    it "returns tag names" do
      expect(pin1.all_tags).to include('tag1')
      expect(pin1.all_tags).to include('tag2')
    end
  end

  context '#all_tags=' do
    it 'show tage for pin' do
      expect(pin2.tags).to eq([])
    end

    it 'creates new tag' do
      pin2.all_tags = 'bic'
      expect(pin2.tags.count).to eq(1)
      expect(pin2.tags.first.name).to eq('bic')
    end

    it 'creates more tags' do
      pin2.all_tags = 'mike, nick'
      expect(pin2.tags.count).to eq(2)
    end
  end
end