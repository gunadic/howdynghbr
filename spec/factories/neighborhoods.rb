# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :neighborhood do
    sequence(:name) {|n| "Neighborhood #{n}"}
    city "Boston"
    state "MA"
    coordinates "somewhere"
  end
end
