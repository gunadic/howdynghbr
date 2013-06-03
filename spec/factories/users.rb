# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_name "MyString"
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    tag_line "MyString"
    short_bio "MyText"
    position "MyText"
    fave_category_id 1
  end
end
