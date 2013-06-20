require 'spec_helper'
include Warden::Test::Helpers


# As a user,
# I want to create new meetups
# so that I can meet my neighbors.

# Acceptance Criteria
# - A logged in user can create a new meetup.
# - A user can set the date/time, category, 
#     location/neighborhood and description of their meetup.
# - A user first selects their neighborhood and then the location
#     from a list of locations located within that neighborhood
# - A user must be logged in to create the meetup.
# - A meetup must have a date/time set in the future.
# - A meetup must have all fields set.
# - A user can only have one meetup for a specified start time.


describe 'creating a new meetup' do

  it "  a signed in user sees a New Meetup link in the header" do
    visit '/'
    expect(page).to_not have_content("New Meetup")
    user = FactoryGirl.create(:user) 
    click_link "Login"
    fill_in 'Email', with: user.email 
    fill_in 'Password', with: user.password
    click_button "Sign in"
    expect(page).to have_content("New Meetup")
  end

  it "  a signed in user is brought to a new meetup form after clicking new meetup" do
    visit '/'
    expect(page).to_not have_content("New Meetup")
    user = FactoryGirl.create(:user) 
    click_link "Login"
    fill_in 'Email', with: user.email 
    fill_in 'Password', with: user.password
    click_button "Sign in"
    click_link "New Meetup"
    expect(page).to have_content("Date")
    expect(page).to have_content("Time")
    expect(page).to have_content("Category")
    expect(page).to have_content("Neighborhood")
    expect(page).to have_content("Location")
    expect(page).to have_content("Description")
    expect(page).to have_button("Create Meetup")
  end





end