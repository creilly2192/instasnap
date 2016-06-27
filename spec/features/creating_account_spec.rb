require 'rails_helper.rb'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Create Account'
  end

  scenario 'create a new user via index page' do
    fill_in 'User Name', with: 'rails'
    fill_in 'Email', with: 'rails@gmail.com'
    find('#user_password').set('justfuckingwork')
    find('#user_password_confirmation').set('justfuckingwork')
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'rails@gmail.com'
    find('#user_password').set('justfuckingwork')
    find('#user_password_confirmation').set('justfuckingwork')
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be longer than 4 characters' do
    fill_in 'User Name', with: 'h'
    fill_in 'Email', with: 'rails@gmail.com'
    find('#user_password').set('justfuckingwork')
    find('#user_password_confirmation').set('justfuckingwork')
    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end

  scenario 'requires a user name to be no longer than 16 characters' do
    fill_in 'User Name', with: 'hhyhyijiynhlghytfdt'
    fill_in 'Email', with: 'rails@gmail.com'
    find('#user_password').set('justfuckingwork')
    find('#user_password_confirmation').set('justfuckingwork')
    click_button 'Sign up'
    expect(page).to have_content("too long")
  end
end
