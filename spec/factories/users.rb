# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "gunadic"
    first_name "Chris"
    last_name "Gunadi"
    email "gunadic@gmail.com"
    tag_line "Howdy y'all!"
    short_bio "MyText"
    position "MyText"
  end
end
