# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meetup do
    user
    category
    meet_up_time "2013-06-02 18:35:53"
    is_past false
    description "MyText"
  end
end
