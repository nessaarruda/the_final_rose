Bachelorette.destroy_all
ContestantOuting.destroy_all
Outing.destroy_all
Contestant.destroy_all

bachelorette_1 = Bachelorette.create(name: 'Abby', season_number: 1, description: 'First of many')
bachelorette_2 = Bachelorette.create(name: 'Bia', season_number: 2, description: 'Second of many')
bachelorette_3 = Bachelorette.create(name: 'Cami', season_number: 3, description: 'Thrid of many')

contestant_1 = bachelorette_1.contestants.create(name: 'Harry', age: 23, hometown: 'Denver')
contestant_2 = bachelorette_1.contestants.create(name: 'Ben', age: 24, hometown: 'Boulder')
contestant_3 = bachelorette_1.contestants.create(name: 'Tim', age: 25, hometown: 'San Jose')
contestant_4 = bachelorette_1.contestants.create(name: 'Mark', age: 26, hometown: 'Littletown')
contestant_5 = bachelorette_1.contestants.create(name: 'Kevin', age: 27, hometown: 'Someplace')
contestant_6 = bachelorette_2.contestants.create(name: 'Bob', age: 28, hometown: 'There')
contestant_7 = bachelorette_2.contestants.create(name: 'John', age: 29, hometown: 'Here')
