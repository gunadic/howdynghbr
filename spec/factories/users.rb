# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    sequence(:user_name) {|m| "user_#{m}"}
    first_name "bill"
    last_name "smith"
    password "1234578a"
    sequence(:email) {|n| "email#{n}@factory.com" }
    tag_line "Howdy y'all!"
    short_bio "MyText"
    position "MyText"
  end
end
