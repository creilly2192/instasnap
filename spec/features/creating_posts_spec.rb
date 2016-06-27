require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create :user

    sign_in_with user
  end
  scenario 'can create a job' do
    click_link 'New Post'
    attach_file('post_image', "spec/files/images/profile.png")
    fill_in 'post_caption', with: 'nom nom nom #profile'
    click_button 'Create Post'
    expect(page).to have_content('#profile')
    expect(page).to have_css("img[src*='profile.png']")
    expect(page).to have_content('Arnie')
  end

  it 'needs an image to create a post' do
    click_link 'New Post'
    fill_in 'post_caption', with: 'something something'
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end
end
