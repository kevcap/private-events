require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  before :each do
    User.create(username: 'Tester', email: 'tester@gmail.com')
  end

  scenario 'Has a sign up page' do
    visit new_user_path
    expect(page).to have_content 'register'
  end

  scenario 'Sign in a user' do
    visit new_user_path
    fill_in 'username', with: 'kevin1'
    fill_in 'user_email', with: 'kevin1@gmail.com'
    click_button('Register')
    expect(page).to have_content 'kevin1'
  end

  scenario 'Redirects to user sign in page after unsuccessful loggin in attempt' do
    visit login_url
    fill_in 'user_email', with: 'tester'
    click_button('Login')
    expect(page).to have_current_path(login_path)
  end
end
