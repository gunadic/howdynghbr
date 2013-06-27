# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meetup do
    user
    category
    neighborhood
    location
    meetup_date Time.now
    meetup_time Time.now 
    is_past false
    description "MyText"
  end
end
