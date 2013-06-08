require 'spec_helper'

describe Participation do

  describe "association tests" do
    it{should belong_to(:meetup)}
    it{should belong_to(:user)}
    it{should have_one(:review)}
  end

  it "must have a meetup_id and a user_id" do
    temp = FactoryGirl.build(:participation, :user_id => nil)
    expect(temp).to_not be_valid
    temp.user_id = 1
    temp.meetup_id = nil
    expect(temp).to_not be_valid
  end

end
