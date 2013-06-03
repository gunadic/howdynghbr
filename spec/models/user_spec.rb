require 'spec_helper'

describe User do

  it "must have a unique user name" do
    FactoryGirl.create(:user)
    temp = FactoryGirl.build(:user)
    expect(temp.valid?).to eql(false)
  end

end
