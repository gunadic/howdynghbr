# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :neighborhood do
    name "Coolidge Corner"
    city "Boston"
    state "MA"
    coordinates "somewhere"
  end
end
