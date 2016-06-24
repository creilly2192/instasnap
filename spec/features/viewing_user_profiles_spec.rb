feature 'viewing user profiles' do
  background do
    user = create :user
    user_two = create(:user, email: 'hi@hi.com',
                             user_name: 'BennyBoy',
                             id: 2)
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: 2, caption: 'cool')

    sign_in_with user
    visit '/'
    first('.user-name').click_link 'Arnie'
  end

  scenario 'visiting a profile page shows the user name in the url' do
    # Expect the page's URL to be '/users/user-name'.
    expect(page.current_path).to eq(profile_path('Arnie'))
  end

  scenario "a profile page only shows the specified user's posts" do
    # expect the page to show the user-owned post.
    expect(page).to have_content 'nofilter'
    # expect the page to not show the other user's post.
    expect(page).to_not have_content 'cool'
  end
end
