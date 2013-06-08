require 'spec_helper'
require 'pry'
describe User do

  describe "shoulda tests" do
    it{ should have_many(:meetups)}
    it{ should have_many(:participations)}
    it{ should have_many(:reviews).through(:participations)}
    it{ should have_one(:favorite_category)}
    it{ should have_one(:category).through(:favorite_category)}
  end


  it "must have a unique user name" do
    FactoryGirl.create(:user)
    temp = FactoryGirl.build(:user, :email => "notdefault@factory.com")
    expect(temp.valid?).to eql(false)
  end

  it "must have a unique email address" do
    FactoryGirl.create(:user)
    temp = FactoryGirl.build(:user, :user_name => "temp1")
    expect(temp.valid?).to eql(false)
  end

  it "has participations" do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:participation, :user_id => user.id)
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
    expect(user.reviews).to include(review)
  end


end
