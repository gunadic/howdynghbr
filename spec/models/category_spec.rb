require 'spec_helper'

describe Category do

  it{should have_many(:favorite_categories)}
  it{should have_many(:users).through(:favorite_categories)}

  it "must have a name" do
    temp = FactoryGirl.build(:category)
    temp.name = nil
    expect(temp.valid?).to eql(false)
  end

  it "can't have the same name as another category" do
    temp = FactoryGirl.create(:category)
    expect(FactoryGirl.build(:category, :name => temp.name).valid?).to eql(false)
  end

end
