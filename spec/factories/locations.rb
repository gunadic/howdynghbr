# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :street_address do |n|
    "#{n} Summer Street"
  end

  sequence :name do |n|
    "Location Name #{n}"
  end

  factory :location do
    name :name
    street_address :street_address
    city "Boston"
    state "MA"
    zip "02445"
    neighborhood_id 1
  end
end
