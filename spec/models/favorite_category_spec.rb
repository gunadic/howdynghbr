require 'spec_helper'


describe FavoriteCategory do
  it{should belong_to(:user)}
  it{should belong_to(:category)}

  it " must have values for both fields" do
    temp = FactoryGirl.build(:favorite_category, :category_id => nil)
    expect(temp).to_not be_valid
    temp = FactoryGirl.build(:favorite_category, :user_id => nil)
    expect(temp).to_not be_valid
    temp = FactoryGirl.build(:favorite_category)
    expect(temp).to be_valid
  end
end
