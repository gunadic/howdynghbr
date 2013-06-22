# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :user_name do |n|
    "user#{n}"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    user_name 
    first_name "bill"
    last_name "smith"
    password "1234578a"
    email
    tag_line "Howdy y'all!"
    short_bio "MyText"
    position "MyText"
  end
end
