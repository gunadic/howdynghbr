# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.destroy_all
Neighborhood.destroy_all
Location.destroy_all


boston_hoods = ["Allston/Brighton","Back Bay","Bay Village","Beacon Hill",
  "Charlestown","Chinatown","Dot","Downtown","Eastie","Fenway","Hyde Pahk",
  "JP","Mattapan","Mission Hill","North End","Roslindale","Roxbury","Southie",
  "South End","West End","West Roxbury"]

cambridge_hoods = ["Aggasiz","Area 2/MIT","Area Four","Cambridgeport","Cambridge Highlands",
  "East Cambridge","Mid-Cambridge","Neighborhood Nine","North Cambridge","Riverside",
  "Wellington-Harrington"]

brookline_hoods = ["Brookline Hills","Brookline Village","Chestnut Hill","Coolidge Corner",
  "Longwood","North Brookline","Pill Hill","Washington Square"]

 category_array = ["Lunch","Dinner","Drinks","Coffee","Shop","Explore",
  "Learn"]

  locations = [{
    name: "Mission Control",
    street_address: "337 Summer St",
    city: "Boston",
    state: "MA",
    neighborhood: "Southie",
    zip: "02210"
    },{
    name: "Cutty's",
    street_address: "284 Washington St",
    city: "Brookline",
    state: "MA",
    neighborhood: "Brookline Village",
    zip: "02445"
    }
  ]

category_array.each do |c|
  Category.create(:name => c)
end

boston_hoods.each do|hood|
  Neighborhood.create(:name => hood, :city => "Boston", :state => "MA")

end

cambridge_hoods.each do|hood|
  Neighborhood.create(:name => hood, :city => "Cambridge", :state => "MA")
end

brookline_hoods.each do|hood|
  Neighborhood.create(:name => hood, :city => "Brookline", :state => "MA")
end

locations.each do |l|
  hood = Neighborhood.find_by_name(l.delete(:neighborhood))
  loc = Location.new(l)
  loc.neighborhood = hood
  loc.save

end



