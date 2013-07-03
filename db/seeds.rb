# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'


@new_records = 0

boston_hoods = ["Allston/Brighton","Back Bay","Bay Village","Beacon Hill",
  "Charlestown","Chinatown","Dot","Downtown","Eastie","Fenway","Hyde Pahk",
  "JP", "Leather District","Mattapan","Mission Hill","North End","Roslindale","Roxbury","Southie",
  "South End","West End","West Roxbury"]

cambridge_hoods = ["Aggasiz","Area 2/MIT","Area Four","Cambridgeport","Cambridge Highlands",
  "East Cambridge","Mid-Cambridge","Neighborhood Nine","North Cambridge","Riverside",
  "Wellington-Harrington"]

brookline_hoods = ["Brookline Hills","Brookline Village","Chestnut Hill","Coolidge Corner",
  "Longwood","North Brookline","Pill Hill","Washington Square"]

 category_array = ["Lunch","Dinner","Drinks","Coffee","Shop","Explore",
  "Learn"]

  @locations = []
  def load_from_csv
    CSV.foreach('./db/locations.csv', 'r') do |row|
      location = {
        name: row[0],
        street_address: row[1].lstrip!,
        city: row[2].lstrip!,
        state: row[3].lstrip!,
        neighborhood: row[4].lstrip!,
        zip: row[5]
      }
      @locations << location
    end
  end

category_array.each do |c|
  if Category.find_by_name(c).nil?
    Category.create(:name => c)
    puts "#{c} category created"
    @new_records+=1
  end
end

boston_hoods.each do|hood|
  if Neighborhood.where(:city => "Boston").find_by_name(hood).nil?
    Neighborhood.create(:name => hood, :city => "Boston", :state => "MA")
    puts "#{hood}, neighborhood created"
    @new_records+=1
  end
end

cambridge_hoods.each do|hood|
  if Neighborhood.where(:city => "Cambridge").find_by_name(hood).nil?
    Neighborhood.create(:name => hood, :city => "Cambridge", :state => "MA")
    puts "#{hood}, neighborhood created"
    @new_records+=1
  end
end

brookline_hoods.each do|hood|
  if Neighborhood.where(:city => "Brookline").find_by_name(hood).nil?
    Neighborhood.create(:name => hood, :city => "Brookline", :state => "MA")
    puts "#{hood}, neighborhood created"
    @new_records+=1
  end
end

load_from_csv
@locations.each do |l|
  hood = Neighborhood.find_by_name(l.delete(:neighborhood))
  if hood.locations.find_by_street_address(l[:street_address]).nil?
    loc = Location.new(l)
    loc.neighborhood = hood
    loc.save
    puts "#{loc[:name]} in #{hood.name} created"
    @new_records+=1
  end
end

puts "#{@new_records} new records created."

