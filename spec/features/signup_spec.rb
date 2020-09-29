require 'rails_helper'

RSpec.describe 'signup', type: :feature do
  scenario 'valid inputs' do
    visit '/signup'
    expect(page).to have_content('Enter a unique username')
    fill_in 'user_name', with: 'alice'
    within('.new-user-btn') do
      click_on 'Register'
    end
    expect(page).to have_content('Welcome to Articles Tree!')
  end

  scenario 'invalid inputs' do
    visit '/signup'
    expect(page).to have_content('Enter a unique username')
    fill_in 'user_name', with: 'a'
    within('.new-user-btn') do
      click_on 'Register'
    end
    expect(page).to have_content('Name is too short (minimum is 3 characters)')
  end
end
