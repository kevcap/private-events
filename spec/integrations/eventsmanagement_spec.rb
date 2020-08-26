require 'rails_helper'
feature 'Events features', type: :feature do
  scenario 'display events show page at root' do
    visit '/'
    expect(page).to have_content('Listing all Events:')
    expect(page).to have_content('Create new event')
  end

  scenario 'test create event without login' do
    visit '/events/new'

    expect(current_path).to eq('/login')
    expect(page).to have_content('You must be logged in to perform that action')
  end

  feature 'After login' do    
    scenario 'open create event page after login / sign up' do
      visit new_user_path
      fill_in 'username', with: 'kevin1'
      fill_in 'user_email', with: 'kevin1@gmail.com'
      click_button('Register')
      visit new_event_path
      expect(page).to have_content('Create Event')
    end
  end
end