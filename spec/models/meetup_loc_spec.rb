require 'spec_helper'

describe MeetupLoc do

  describe " association tests" do
    it{should belong_to(:meetup)}
    it{should belong_to(:location)}
  end

  it " requires a non-nil meetup_id and location_id" do
    temp = FactoryGirl.build(:meetup_loc)
    expect(temp).to be_valid
    temp = FactoryGirl.build(:meetup_loc, :meetup_id => nil)
    expect(temp).to_not be_valid
    temp = FactoryGirl.build(:meetup_loc, :location_id => nil)
    expect(temp).to_not be_valid
  end


end
