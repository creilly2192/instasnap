feature 'liking posts' do
  background do
    user = create :user
    post = create(:post, user_id: user.id)
    visit '/'
  end

  scenario 'can like a post' do
    click_link 'like_1'

    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Arnie')
  end

  scenario 'can unlike a post' do
    click_link 'like_1'

    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Arnie')
  end
end
