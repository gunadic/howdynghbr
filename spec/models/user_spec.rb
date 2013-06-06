require 'spec_helper'
require 'pry'
describe User do

  it "must have a unique user name" do
    FactoryGirl.create(:user)
    temp = FactoryGirl.build(:user)
    expect(temp.valid?).to eql(false)
  end

  it "has participations" do
    user = FactoryGirl.create(:user)
    temp = FactoryGirl.create(:participation, :user_id => user.id)
    expect(user.participations).to_not eql([])
  end

  it "has meetups which have foreign key user_id = the the user's id" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup, :user_id => user.id)
    expect(user.meetups).to include(meetup)
  end

  it "has a review through participation" do
    user = FactoryGirl.create(:user)
    temp = FactoryGirl.create(:participation, :user_id => user.id)
    review = FactoryGirl.create(:review, :participation_id => temp.id)
    binding.pry
    expect(user.reviews).to include(review)
  end


end
