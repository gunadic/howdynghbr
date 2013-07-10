require 'spec_helper'
#include Warden::Test::Helpers
# As a user,
# I want to be able to sign-up for a meetup
# so that the host knows who is coming.

# Acceptance Criteria
# 1) Meetup detail page has an "I'm in!" button.
# 2) Meetup detail page has list of people who have signed up.
# 3) Users can view the profiles of other attendees.
# 4) User can only sign up for the meetup once.

describe 'signing up for a meetup/creating new participation' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup) }

  before(:each) do
    sign_in_as(user)
    #login_as(user, :scope => :user)
  end

  it " a user can sign up by pressing the I'm in! button" do
    visit meetup_path(meetup)
    click_on("I'm in!")
    expect(meetup.user_signed_up?(user)).to be_true
  end

  it " participating users are listed on the details page" do
    visit meetup_path(meetup)
    click_on("I'm in!")
    expect(page).to have_content(user.user_name)
  end

  it "does not allow a user to create multiple participations" do
    visit meetup_path(meetup)
    click_on("I'm in!")
    expect(page).to_not have_content("I'm in!")
  end

  it ", attendees profile view pages are accessible through the details page" do
    visit meetup_path(meetup)
    click_on("I'm in!")
    click_on(user.user_name)
    expect(page).to have_content(user.user_name)
    expect(page).to have_content(user.short_bio)
  end
end

describe 'canceling meetup participation' do
  let(:user) { FactoryGirl.create(:user) }
  let(:meetup) { FactoryGirl.create(:meetup) }

  before :each do
    sign_in_as user
  end

  it "a user can cancel his participation in an event" do
    # login_as(user, :scope => :user)
    visit meetup_path(meetup)
    click_on("I'm in!")
    expect(meetup.user_signed_up?(user)).to be_true
    expect(page).to_not have_content("I'm in!")
    click_on("Nevermind...")
    expect(meetup.user_signed_up?(user)).to be_false
  end

  it " a user's name is no longer listed after they cancel participation" do
    # login_as(user, :scope => :user)
    visit meetup_path(meetup)
    click_on("I'm in!")
    expect(meetup.user_signed_up?(user)).to be_true
    expect(page).to_not have_content("I'm in!")
    click_on("Nevermind...")
    expect(page).to_not have_content(user.user_name)
  end


end
