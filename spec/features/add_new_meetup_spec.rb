require 'spec_helper'
include Warden::Test::Helpers


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
  end

end