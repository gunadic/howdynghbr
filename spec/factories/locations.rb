# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    street_address "337 Summer Street"
    city "Boston"
    state "MA"
    zip "02445"
    neighborhood_id 1
  end
end
