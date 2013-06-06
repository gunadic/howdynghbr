require 'spec_helper'

describe Meetup do

  it "has a meetup_loc" do
    temp1 = FactoryGirl.build(:meetup_loc)
    temp2 = FactoryGirl.create(:meetup)
    loc = FactoryGirl.create(:location)
    temp1.location_id = loc.id
    temp1.meetup_id = temp2.id
    temp1.save
    expect(temp2.meetup_loc.location).to eql(loc)
  end

end
