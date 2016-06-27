feature 'liking posts' do
  background do
    user = create :user
    
    visit '/'
  end

  scenario 'can like a post' do
    find("a#like_1").click

    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Arnie')
  end

  scenario 'can unlike a post' do
    find("a#like_1").click

    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Arnie')
  end
end
