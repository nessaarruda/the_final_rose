require 'rails_helper'

describe 'As a visitor when I visit a contestants show page' do
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

    @outing_1 = Outing.create(name: 'Walk on the Park', location: 'Wash Park')
    @outing_2 = Outing.create(name: 'Volley at the Park', location: 'Ruby Park')
    @outing_3 = Outing.create(name: 'People watching at the Park', location: 'Cheeseman Park')

    ContestantOuting.create(contestant_id: @contestant_1.id, outing_id: @outing_1.id)
    ContestantOuting.create(contestant_id: @contestant_1.id, outing_id: @outing_2.id)
    ContestantOuting.create(contestant_id: @contestant_1.id, outing_id: @outing_3.id)

    visit contestant_path(@contestant_1)
  end
  it 'Shows contestant name, season, description and list of all outings' do

    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_1.season)
    expect(page).to have_content(@contestant_1.season_description)
    expect(page).to have_link(@outing_1.name)

    click_on @outing_1.name

    expect(current_path).to eq(outing_path(@outing_1))
  end
end
