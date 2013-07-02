# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :street_address do |n|
    "#{n} Harvard St."
  end

  sequence :name do |n|
    "Location Name #{n}"
  end

  factory :location do
    name 
    street_address
    city "Brookline"
    state "MA"
    zip "02445"
    neighborhood
  end
end
