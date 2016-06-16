require 'rails_helper.rb'

feature 'Index page displays posts' do
  background do
    post_one = create(:post, caption: "This is one post")
    post_two = create(:post, caption: "This is two post")
    user = create :user

    sign_in_with user
  end
  scenario 'index display correct created post info' do
    expect(page).to have_content("This is one post")
    expect(page).to have_content("This is two post")
    expect(page).to have_css("img[src*='profile']")
  end
end
