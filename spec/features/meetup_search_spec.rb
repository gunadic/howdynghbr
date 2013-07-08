require 'spec_helper'

# As a user,
# I want to be able to search for meetups in my neighborhood
# so I can see information that is relavent to me.

# Criteria
# 1) User can search for their neighborhood on main page.
# 2) Only meetups in searched for neighborhood are returned
# 3) Only future meetups are shown.


describe 'searching from main page' do
  let!(:hood1){ FactoryGirl.create(:neighborhood)}
  let!(:hood2){ FactoryGirl.create(:neighborhood)}
  let!(:meetup1){ FactoryGirl.create(:meetup, :neighborhood => hood1)}
  let!(:past_meetup){ FactoryGirl.create(:meetup, :neighborhood => hood1,
    :meetup_date => DateTime.new(2013, 6, 1),
    :description => "This is a past event.")}
  let!(:meetup2){ FactoryGirl.create(:meetup, :neighborhood => hood2)}
  it ": a user can search from the main page of the app." do
    visit '/'
    select(hood1.name, from: "q[neighborhood_name_eq]")
    click_on 'Search'
    expect(page).to have_content(meetup1.description)
  end

  it ": does not include meetups outside of the neighborhood" do
    visit '/'
    select(hood1.name, from: "q[neighborhood_name_eq]")
    click_on 'Search'
    expect(page).to_not have_content(meetup2.description)
  end

  it "allows a user to switch filters on the meetup index page" do
    visit '/'
    select(hood1.name, from: "q[neighborhood_name_eq]")
    click_on 'Search'
    expect(page).to have_content(meetup1.description)
    select(hood2.name, from: "q[neighborhood_name_eq]")
    click_on 'Search'
    expect(page).to have_content(meetup2.description)
  end

  it "only shows meetups that haven't happened yet" do
    visit '/'
    select(hood1.name, from: "q[neighborhood_name_eq]")
    click_on 'Search'
    expect(page).to_not have_content(past_meetup.description)
  end

end