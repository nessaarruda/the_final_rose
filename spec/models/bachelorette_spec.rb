require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end
  describe 'instance methods' do
    before :each do

      @bachelorette_1 = Bachelorette.create(name: 'Abby', season_number: 1, description: 'First of many')
      @bachelorette_2 = Bachelorette.create(name: 'Bia', season_number: 2, description: 'Second of many')
      @bachelorette_3 = Bachelorette.create(name: 'Cami', season_number: 3, description: 'Thrid of many')

      @contestant_1 = @bachelorette_1.contestants.create(name: 'Harry', age: 23, hometown: 'Denver')
      @contestant_2 = @bachelorette_1.contestants.create(name: 'Ben', age: 24, hometown: 'Denver')
      @contestant_3 = @bachelorette_1.contestants.create(name: 'Tim', age: 25, hometown: 'San Jose')
      @contestant_4 = @bachelorette_1.contestants.create(name: 'Mark', age: 26, hometown: 'Littletown')
      @contestant_5 = @bachelorette_1.contestants.create(name: 'Kevin', age: 27, hometown: 'Someplace')
      @contestant_6 = @bachelorette_2.contestants.create(name: 'Bob', age: 28, hometown: 'There')
      @contestant_7 = @bachelorette_2.contestants.create(name: 'John', age: 29, hometown: 'Here')
    end
    it 'average age of contestants' do
      expect(@bachelorette_1.contestants_average_age).to eq(25)
    end
    it 'contestants home towns' do
      bachelorette_1 = Bachelorette.create(name: 'Abby', season_number: 1, description: 'First of many')
      bachelorette_2 = Bachelorette.create(name: 'Bia', season_number: 2, description: 'Second of many')
      bachelorette_3 = Bachelorette.create(name: 'Cami', season_number: 3, description: 'Thrid of many')

      contestant_1 = bachelorette_1.contestants.create(name: 'Harry', age: 23, hometown: 'Denver')
      contestant_2 = bachelorette_1.contestants.create(name: 'Ben', age: 24, hometown: 'Denver')
      contestant_3 = bachelorette_1.contestants.create(name: 'Tim', age: 25, hometown: 'San Jose')
      contestant_4 = bachelorette_1.contestants.create(name: 'Mark', age: 26, hometown: 'Littletown')
      contestant_5 = bachelorette_1.contestants.create(name: 'Kevin', age: 27, hometown: 'Someplace')
      contestant_6 = bachelorette_2.contestants.create(name: 'Bob', age: 28, hometown: 'There')
      contestant_7 = bachelorette_2.contestants.create(name: 'John', age: 29, hometown: 'Here')

      expect(bachelorette_1.contestants_home_town).to eq(["Denver", "Littletown", "San Jose", "Someplace"])
    end
  end
end
