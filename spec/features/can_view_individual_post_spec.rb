require 'rails_helper.rb'

feature 'Can view an individaul post' do
  scenario 'view post on image click' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
