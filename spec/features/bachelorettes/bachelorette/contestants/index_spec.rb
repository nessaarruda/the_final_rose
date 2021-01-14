require 'rails_helper'

describe 'As a visitor when I visit a bachelorette show page' do
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

    visit bachelorette_contestants_path(@bachelorette_1)
  end
  it 'Shows contestants attributes and the names are links to their show page' do
    expect(page).to have_link(@contestant_1.name)
    expect(page).to have_content(@contestant_1.age)
    expect(page).to have_content(@contestant_1.hometown)
    expect(page).to have_link(@contestant_2.name)
    expect(page).to have_content(@contestant_2.age)
    expect(page).to have_content(@contestant_2.hometown)
    expect(page).to_not have_content(@contestant_6.name)

    click_on @contestant_1.name

    expect(current_path).to eq(contestant_path(@contestant_1))
  end
  it 'Shows unique hometowns for all contestants' do
    expect(page).to have_content(@bachelorette_1.contestants_home_town)
  end
end
