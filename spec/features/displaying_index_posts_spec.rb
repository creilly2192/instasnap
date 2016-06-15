require 'rails_helper.rb'

feature 'Index page displays posts' do
  scenario 'index display correct created post info' do
    post_one = create(:post, caption: "This is one post")
    post_two = create(:post, caption: "This is two post")

    visit '/'
    expect(page).to have_content("This is one post")
    expect(page).to have_content("This is two post")
    expect(page).to have_css("img[src*='profile']")
  end
end
