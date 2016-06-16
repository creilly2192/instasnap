require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'stuff')
    user = create :user

    sign_in_with user

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
  end

  scenario 'delete post' do
    click_link 'Delete'

    expect(page).to have_content('Post was deleted!')
    expect(page).to_not have_content('stuff')
  end
end
