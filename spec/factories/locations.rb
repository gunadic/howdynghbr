# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    street_address "MyString"
    city ""
    state "MyString"
    zip 1
    latitude 1.1
    longitude 1.1
    neighborhood_id 1
  end
end
