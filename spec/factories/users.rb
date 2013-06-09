# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "user"
    first_name "bill"
    last_name "smith"
    password "1234578a"
    email "blank@example.com"
    tag_line "Howdy y'all!"
    short_bio "MyText"
    position "MyText"
  end
end
