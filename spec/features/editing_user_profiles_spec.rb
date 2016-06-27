feature 'editing user profiles' do
  background do
    user = create :user
    user_two = create(:user, email: 'hi@hi.com',
                             user_name: 'BennyBoy',
                             id: 2)
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: 2, caption: 'cool')

    sign_in_with user
    visit '/'
  end

  scenario 'a user can change their own profile details' do
    # Click the first user's user name
    click_link 'Arnie', match: :first
    # Click the 'Edit Profile' button.
    click_link 'Edit Profile'
    attach_file('user_avatar', 'spec/files/images/profile.png')
    fill_in 'user_bio', with: 'Is this real life?'
    click_button 'Update Profile'

    expect(page.current_path).to eq(profile_path('Arnie'))
    expect(page).to have_css("img[src*='profile']")
    expect(page).to have_content('Is this real life?')
  end

  scenario 'a user cannot change someone elses profile picture' do
    # Click the first user's user name
    click_link 'BennyBoy', match: :first
    # Expect to not see the 'edit profile' button.
    expect(page).to_not have_content('Edit Profile')
  end

  scenario "a user cannot navigate directly to edit a users profile" do
    # Directly visit another user’s edit url.
    visit '/BennyBoy/edit'
    # Expect to not see ’Change your profile image:'
    expect(page).to_not have_content('Change your profile image:')
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("Stop being a snoop!")
  end
end
