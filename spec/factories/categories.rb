# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :cat_name do |n|
    "Category #{n}"
  end
  factory :category do
    name :cat_name
    parent_id 1
  end
end
