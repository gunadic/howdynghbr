require 'spec_helper'

# As a user, I want the ability to log in and 
# out of an existing account, so that I can log in 
# and log out.

# acceptance criteria
# 1) A user can log in to an existing account.
# 2) Rejects incorrect passwords
# 3) rejects unregistered emails
# 4) has a 'forgot password?' link

describe "signing in" do 

  it "allows users to sign in with sign-in credentials" do
    visit '/users/sign_up'
    fill_in 'User name', with:"test_user"
    fill_in 'First name', with:"test"
    fill_in 'Last name', with:"user"
    fill_in 'Email', with:"test_user@example.com"
    fill_in 'user_password', with:"12345678"
    fill_in 'user_password_confirmation', with:"12345678"
    click_button 'Sign up'
    click_link 'Logout'
    visit '/users/sign_in'
    fill_in 'Email', with:"test_user@example.com"
    fill_in 'Password', with:"12345678"
    click_button "Sign in"
    expect(page).to have_content("Signed in successfully")
  end

  it "rejects logging in with an incorrect password" do
    visit '/users/sign_up'
    fill_in 'User name', with:"test_user"
    fill_in 'First name', with:"test"
    fill_in 'Last name', with:"user"
    fill_in 'Email', with:"test_user@example.com"
    fill_in 'user_password', with:"12345678"
    fill_in 'user_password_confirmation', with:"12345678"
    click_button 'Sign up'
    click_link 'Logout'
    visit '/users/sign_in'
    fill_in 'Email', with:"test_user@example.com"
    fill_in 'Password', with: "13245678"
    click_button "Sign in"
    expect(page).to have_content("Invalid email or password")
  end

  it "rejects logging in with an unregistered email" do
    visit '/users/sign_in'
    fill_in 'Email', with:"doesnt@exist.com"
    fill_in 'Password', with:"12345678"
    click_button "Sign in"
    expect(page).to have_content("Invalid email or password")
  end

  it "has a 'forgot password?' link" do
    visit '/users/sign_in'
    expect(page).to have_content("Forgot your password?")
  end
  
end
