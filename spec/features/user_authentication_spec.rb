require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Log Out')
  end

  scenario 'can log in and then log out from the index' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'
    click_link 'Log Out'

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot view index posts without logging in' do
    visit '/'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario 'cannot create new post without logging in' do
    visit '/'
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end
end
