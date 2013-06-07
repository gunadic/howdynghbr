require 'spec_helper'

describe Location do
  describe " shoulda tests" do
    it{ should belong_to(:neighborhood)}
    it{ should have_many(:meetup_locs)}
    it{ should have_many(:meetups).through(:meetup_locs)}
  end

  describe "validation tests" do

    it " expects a second location with identical .full_address values to be invalid" do
      loc = FactoryGirl.create(:location)
      loc_clone = FactoryGirl.build(:location, street_address: loc.street_address)
      expect(loc_clone).to_not be_valid
    end

  end
end
