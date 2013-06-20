# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meetup do
    user
    category
    meetup_date Time.now.strftime("%D")
    meetup_time Time.now.strftime("%I:%M")
    is_past false
    description "MyText"
  end
end
