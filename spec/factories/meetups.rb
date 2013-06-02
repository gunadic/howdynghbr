# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meetup do
    user_id 1
    category_id 1
    meet_up_time "2013-06-02 18:35:53"
    is_past false
    meetup_loc_id 1
    description "MyText"
  end
end
