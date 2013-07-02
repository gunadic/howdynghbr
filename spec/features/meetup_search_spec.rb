require 'spec_helper'

# As a user,
# I want to be able to search for meetups in my neighborhood
# so I can see information that is relavent to me.

# Criteria
# 1) User can search for their neighborhood on main page.
# 2) Only meetups in searched for neighborhood are returned


describe 'searching from main page' do

  it ": a user can search from the main page of the app." do
    visit '/'
    fill_in 'Search', with: "Coolidge Corner"
    click_in 'Search'
    expect(page).to have_content("Meetups")
  end

end