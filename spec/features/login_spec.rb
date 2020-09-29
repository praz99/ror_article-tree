require 'rails_helper'

describe 'login', type: :feature do
  before(:example) do
    visit signup_path
    expect(page).to have_content('Enter a unique username')
    fill_in 'user_name', with: 'alice'
    within('.new-user-btn') do
      click_on 'Register'
    end
    expect(page).to have_content('Welcome to Articles Tree!')
    click_on 'log out'
  end

  scenario 'valid inputs' do
    visit '/login'
    expect(page).to have_content('Registger Now')
    fill_in 'session_name', with: @user.name
    click_on(class: 'new-session-button')
    expect(page).to have_content('Hello alice! Welcome back.')
  end
end
