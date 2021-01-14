require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :contestant_outings}
    it {should have_many(:outings).through(:contestant_outings)}
  end
  describe 'instance methods' do
    it 'season' do
      bachelorette = Bachelorette.create(name: 'Abby', season_number: 1, description: 'First of many')
      contestant = bachelorette.contestants.create(name: 'Harry', age: 23, hometown: 'Denver')

      expect(contestant.season).to eq(1)
    end
    it 'season description' do
      bachelorette = Bachelorette.create(name: 'Abby', season_number: 1, description: 'First of many')
      contestant = bachelorette.contestants.create(name: 'Harry', age: 23, hometown: 'Denver')

      expect(contestant.season_description).to eq('First of many')
    end
  end
end
