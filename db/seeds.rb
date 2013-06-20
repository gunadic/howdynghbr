# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


boston_hoods = ["Allston/Brighton","Back Bay","Bay Village","Beacon Hill",
  "Charlestown","Chinatown","Dot","Downtown","Eastie","Fenway","Hyde Pahk",
  "JP","Mattapan","Mission Hill","North End","Roslindale","Roxbury","Southie",
  "South End","West End","West Roxbury"]

cambridge_hoods = ["Aggasiz","Area 2/MIT","Area Four","Cambridgeport","Cambridge Highlands",
  "East Cambridge","Mid-Cambridge","Neighborhood Nine","North Cambridge","Riverside",
  "Wellington-Harrington"]

brookline_hoods = ["Brookline Hills","Brookline Village","Chestnut Hill","Coolidge Corner",
  "Longwood","North Brookline","Pill Hill","Washington Square"]

boston_hoods.each do|hood|
  Neighborhood.create(:name => hood, :city => "Boston", :state => "MA")
end

cambridge_hoods.each do|hood|
  Neighborhood.create(:name => hood, :city => "Cambridge", :state => "MA")
end

brookline_hoods.each do|hood|
  Neighborhood.create(:name => hood, :city => "Brookline", :state => "MA")
end




