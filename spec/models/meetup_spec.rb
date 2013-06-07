require 'spec_helper'

describe Meetup do
  # shoulda-matchers tests
  it {should have_one(:meetup_loc)}
  it {should have_many(:participations)}
  it {should have_many(:reviews).through(:participations)}
  it {should belong_to(:category)}
  it {should belong_to(:user)}
  it {should have_one(:location)}

  describe "actual associations tests tests" do
    it "has a meetup_loc" do
      temp1 = FactoryGirl.build(:meetup_loc)
      temp2 = FactoryGirl.create(:meetup)
      loc = FactoryGirl.create(:location)
      temp1.location_id = loc.id
      temp1.meetup_id = temp2.id
      temp1.save
      expect(temp2.meetup_loc.location).to eql(loc)
    end

    it "belongs to a user" do
      user = FactoryGirl.create(:user)
      meetup = FactoryGirl.create(:meetup, :user_id => user.id)
      expect(user.meetups).to include(meetup)
    end

    it "belongs to a category" do
      cat = FactoryGirl.create(:category)
      meetup = FactoryGirl.create(:meetup, :category_id => cat.id)
      expect(cat.meetups).to include(meetup)
    end

    it "has reviews through participations" do
      meetup = FactoryGirl.create(:meetup)
      participation = FactoryGirl.create(:participation, :meetup_id => meetup.id)
      review = FactoryGirl.create(:review, :participation_id => participation.id)
      expect(meetup.reviews).to include(review)
    end
  end

end
