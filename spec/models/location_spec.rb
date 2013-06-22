require 'spec_helper'

describe Location do
  describe " shoulda tests" do
    it{ should belong_to(:neighborhood)}
    it{ should have_many(:meetups)}
  end

  describe "validation tests" do

    it " expects a second location with identical .full_address values to be invalid" do
      loc = FactoryGirl.create(:location)
      loc_clone = FactoryGirl.build(:location, street_address: loc.street_address)
      expect(loc_clone).to_not be_valid
    end

    it " requires :city to not be nil" do
      loc = FactoryGirl.build(:location, city: nil)
      expect(loc).to_not be_valid
    end

    it " requires :name to not be nil" do
      loc = FactoryGirl.build(:location, name: nil)
      expect(loc).to_not be_valid
    end

    it " requires :state to not be nil" do
      loc = FactoryGirl.build(:location, state: nil)
      expect(loc).to_not be_valid
    end

    it " requires :street_address to not be nil" do
      loc = FactoryGirl.build(:location, street_address: nil)
      expect(loc).to_not be_valid
    end

    it " requires :zip to not be nil" do
      loc = FactoryGirl.build(:location, zip: nil)
      expect(loc).to_not be_valid
    end

  end
end
