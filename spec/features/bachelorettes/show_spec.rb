require 'rails_helper'

describe 'As a visitor when I visit a bachelorette show page' do
  before :each do

    @bachelorette_1 = Bachelorette.create(name: 'Abby', season_number: 1, description: 'First of many')
    @bachelorette_2 = Bachelorette.create(name: 'Bia', season_number: 2, description: 'Second of many')
    @bachelorette_3 = Bachelorette.create(name: 'Cami', season_number: 3, description: 'Thrid of many')

    @contestant_1 = @bachelorette_1.contestants.create(name: 'Harry', age: 23, hometown: 'Denver')
    @contestant_2 = @bachelorette_1.contestants.create(name: 'Ben', age: 24, hometown: 'Boulder')
    @contestant_3 = @bachelorette_1.contestants.create(name: 'Tim', age: 25, hometown: 'San Jose')
    @contestant_4 = @bachelorette_1.contestants.create(name: 'Mark', age: 26, hometown: 'Littletown')
    @contestant_5 = @bachelorette_1.contestants.create(name: 'Kevin', age: 27, hometown: 'Someplace')
    @contestant_6 = @bachelorette_2.contestants.create(name: 'Bob', age: 28, hometown: 'There')
    @contestant_7 = @bachelorette_2.contestants.create(name: 'John', age: 29, hometown: 'Here')

    visit bachelorette_path(@bachelorette_1)
  end

  it 'Shows the attributes and has a link to all contestants for that bachelorette' do
    expect(page).to have_content(@bachelorette_1.name)
    expect(page).to have_content(@bachelorette_1.season_number)
    expect(page).to have_content(@bachelorette_1.description)
    expect(page).to have_link("My Contestants")

    click_on "My Contestants"

    expect(current_path).to eq(bachelorette_contestants_path(@bachelorette_1))
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_2.name)
    expect(page).to have_content(@contestant_3.name)
    expect(page).to have_content(@contestant_4.name)
    expect(page).to have_content(@contestant_5.name)
    expect(page).to_not have_content(@contestant_6.name)
    expect(page).to_not have_content(@contestant_7.name)
  end
  it 'shows average of contestants age' do
    expect(page).to have_content(@bachelorette_1.contestants_average_age)
  end
end
