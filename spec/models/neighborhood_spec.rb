require 'spec_helper'

describe Neighborhood do

  describe "association tests" do
    it{ should have_many(:locations)}
  end

  it " requires all fields to not be nil" do
    temp = FactoryGirl.build(:neighborhood, :state => nil)
    expect(temp).to_not be_valid
    temp.state = "MA"
    temp.name = nil
    expect(temp).to_not be_valid
    temp.name = "Coolidge Corner"
    temp.city = nil
    expect(temp).to_not be_valid
  end

  it " name must be unique in a city/state combo" do
    FactoryGirl.create(:neighborhood)
    temp = FactoryGirl.build(:neighborhood)
    expect(temp).to_not be_valid
  end

  it " can have same name as other neighborhoods in other city/state" do
    FactoryGirl.create(:neighborhood)
    temp = FactoryGirl.build(:neighborhood, :state => "NY")
    expect(temp).to be_valid
  end


end
