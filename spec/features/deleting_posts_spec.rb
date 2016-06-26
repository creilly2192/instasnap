require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    user = create :user
    post = create( :post )

    sign_in_with user

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
  end

  scenario 'delete post' do
    click_link 'Delete'

    expect(page).to have_content('Post was deleted!')
    expect(page).to_not have_content('stuff')
  end
end
