require 'spec_helper'
include Warden::Test::Helpers
# As a user,
# I want to be able to sign-up for a meetup
# so that the host knows who is coming.

# Acceptance Criteria
# 1) Meetup detail page has an "I'm in!" button.
# 2) Meetup detail page has list of people who have signed up.
# 3) Users can view profiles of people who ahve signed up by clicking on them.
# 4) User can only sign up for the meetup once.
# 5) User can cancel participation.

describe 'signing up for a meetup' do 

  before(:each) do
    FactoryGirl.create(:user)
    @temp = FactoryGirl.create(:user)
    login_as(@temp, :scope => :user)
    @meetup = FactoryGirl.create(:meetup)
  end

  it " a meetup detail page has a 'I'm In! button" do
    visit meetup_path(@meetup.id)
    former_participants = @meetup.participations.length
    click_on("I'm in!")
    expect(@meetup.reload.participations.length).to eql(former_participants+1)
    binding.pry
  end



  
end