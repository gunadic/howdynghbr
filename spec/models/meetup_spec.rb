require 'spec_helper'

describe Meetup do
  # shoulda-matchers tests
  it {should have_many(:participations)}
  it {should have_many(:reviews).through(:participations)}
  it {should belong_to(:category)}
  it {should belong_to(:user)}
  it {should belong_to(:location)}

  describe "actual associations tests tests" do


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
