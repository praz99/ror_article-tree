require 'rails_helper'

RSpec.describe 'Features', type: :feature do
  before(:each) do
    visit signup_path
    expect(page).to have_content('Enter a unique username')
    fill_in 'user_name', with: 'alice'
    within('.new-user-btn') do
      click_on 'Register'
    end
    expect(page).to have_content('Welcome to Articles Tree!')
  end

  scenario 'create new category' do
    visit new_category_path
    expect(page).to have_content('Cancel')
    fill_in 'category_name', with: 'fashion'
    fill_in 'category_priority', with: '10'
    click_on 'Submit'
    expect(page).to have_content('You created a new category!')
  end

  scenario 'write new article' do
    visit new_category_path
    expect(page).to have_content('Cancel')
    fill_in 'category_name', with: 'fashion'
    fill_in 'category_priority', with: '10'
    click_on 'Submit'
    expect(page).to have_content('You created a new category!')

    visit new_article_path
    expect(page).to have_content('Get an interesting title.')
    # fill_in 'article_title', with: 'New test Article'
    # fill_in 'article_text', with: 'test Article text'
    # attach_file('article_image', Rails.root.join('spec/factories/dom-hill-nimElTcTNyY-unsplash.jpg'))
    # find('#article_category_ids').all(:css, 'option').find { |o| o.value == '2' }.select_option
    # # all('#article_category_ids')[0].select_option
    # click_on 'Submit'
    # expect(page).to have_content('Article created successfully!')
  end
end
