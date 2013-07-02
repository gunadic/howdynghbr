require 'spec_helper'

# As a user,
# I want to be able to search for meetups in my neighborhood
# so I can see information that is relavent to me.

# Criteria
# 1) User can search for their neighborhood on main page.
# 2) Only meetups in searched for neighborhood are returned


describe 'searching from main page' do
  let!(:hood1){ FactoryGirl.create(:neighborhood)}
  let!(:hood2){ FactoryGirl.create(:neighborhood)}
  # let(:meetup1){ FactoryGirl.create(:meetup, :neighborhood => hood1)}
  # let(:meetup2){ FactoryGirl.create(:meetup, :neighborhood => hood2)}
  it ": a user can search from the main page of the app." do
    meetup1 = FactoryGirl.create(:meetup, :neighborhood => hood1)
    binding.pry
    meetup2 = FactoryGirl.create(:meetup, :neighborhood => hood2)
    visit '/'
    select(hood1.name, from: "Neighborhood:")
    click_on 'Search'
    expect(page).to have_content(meetup1.description)
  end

end