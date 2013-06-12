require 'spec_helper'

# As a user, 
# I want to be able to register an account,
# so that I can use the service

# Acceptance Criteria
# -User, First and Last name, email and password required
# -I must confirm my password
# -The password must be at least 8 characters long
# -After registration, I am presented with the logged-in page

describe 'registering new user' do
  it 'has a sign_up page' do
    visit'/users/sign_up'
    expect(page).to have_content('Forgot your password?')
  end

  it "doesn't accept submission with all fields blank" do
    visit'/users/sign_up'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  it "doesn't allow you to sign up with an already taken" do
    visit '/users/sign_up'
    fill_in 'User name', with:"test_user"
    fill_in 'First name', with:"test"
    fill_in 'Last name', with:"user"
    fill_in 'Email', with:"test_user@example.com"
    fill_in 'Password', with:"12345678"
    fill_in 'Password confirmation', with:"12345678"
    click_button 'Sign up'
    click_link 'Logout'
    visit '/users/sign_up'
    fill_in 'User name', with:"test_user"
    fill_in 'First name', with:"test"
    fill_in 'Last name', with:"user"
    fill_in 'Email', with:"test_user@example.com"
    fill_in 'Password', with:"12345678"
    fill_in 'Password confirmation', with:"12345678"
    click_button 'Sign up'
    expect(page).to have_content("has already been taken")
  end
  
end