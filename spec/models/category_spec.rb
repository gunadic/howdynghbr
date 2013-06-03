require 'spec_helper'

describe Category do

  it "must have a name" do
    temp = FactoryGirl.build(:category)
    temp.name = nil
    expect(temp.valid?).to eql(false)
  end

  it "can't have the same name as another category" do
    FactoryGirl.create(:category)
    temp = FactoryGirl.build(:category)
    expect(temp.valid?).to eql(false)
  end

end
