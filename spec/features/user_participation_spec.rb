require 'spec_helper'
include Warden::Test::Helpers
# As a user,
# I want to be able to sign-up for a meetup
# so that the host knows who is coming.

# Acceptance Criteria
# 1) Meetup detail page has an "I'm in!" button.
# 2) Meetup detail page has list of people who have signed up.
# 3) User can only sign up for the meetup once.

describe 'signing up for a meetup' do 

  before(:each) do
    FactoryGirl.create(:user)
    @temp = FactoryGirl.create(:user)
    login_as(@temp, :scope => :user)
    @meetup = FactoryGirl.create(:meetup)
  end

  it " a user can sign up by pressing the I'm in! button" do
    visit meetup_path(@meetup.id)
    former_participants = @meetup.participations.length
    click_on("I'm in!")
    expect(@meetup.reload.participations.length).to eql(former_participants+1)
  end

  it " participating users are listed on the details page" do 
    visit meetup_path(@meetup.id)
    click_on("I'm in!")
    expect(page).to have_content(@temp.user_name)
  end

  it "does not allow a user to create multiple participations" do
    visit meetup_path(@meetup.id)
    click_on("I'm in!")
    click_on("I'm in!")
    expect(page).to have_content("Hold your horses,")
  end

  
end