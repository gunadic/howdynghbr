require 'spec_helper'

# As a user,
# I want to have a profile page,
# so that others can know who I am.

# AC
# 1) Profile page should include the username, first name/last initial, 
#   tag line and short-bio
# 2) Includes a section for stats.
# 3) Includes a list of past meetups attended

describe "viewing a user profile" do
  let!(:user1){FactoryGirl.create(:user)}
  let!(:meetup1){FactoryGirl.create(:meetup, meetup_date: Time.now)}
  let!(:meetup2){FactoryGirl.create(:meetup, 
    :meetup_date => DateTime.new(2013, 6, 1))}
  let!(:meetup3){FactoryGirl.create(:meetup, user: user1)}
  let!(:meetup4){FactoryGirl.create(:meetup, user: user1)}

  it "displays all of a user's information" do
    visit user_path(user1)
    expect(page).to have_content(user1.user_name)
    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user1.last_name)
    expect(page).to have_content(user1.tag_line)
    expect(page).to have_content(user1.short_bio)
  end

  it "displays a small section about the user's site usage" do
    meetup3
    visit user_path(user1)
    expect(page).to have_content("Meetups Created: #{user1.meetups.count}")
    expect(page).to have_content("Meetups Attended: #{user1.participations.count}")
  end

  it "contains a list of the meetups the user has attended" do
    temp = Participation.new(user: user1, meetup: meetup2)
    temp.save
    visit user_path(user1)
    expect(page).to have_content("Meetups #{user1.user_name} attended:")
    expect(page).to have_content(meetup2.in_words_past)
    expect(page).to_not have_content(meetup1.in_words_past)
  end

  it "contains a list of meetups the user has created" do
    pending
    visit user_path(user1)
    expect(page).to have_content("Meetups #{user1.user_name} hosted:")
    expect(page).to have_content(meetup3.in_words)
    expect(page).to have_content(meetup4.in_words)
  end
  
end