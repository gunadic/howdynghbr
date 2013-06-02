# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    participation_id 1
    rating 1
    review "MyText"
  end
end
