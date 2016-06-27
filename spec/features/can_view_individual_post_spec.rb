require 'rails_helper.rb'

feature 'Can view an individaul post' do
  background do
    user = create :user
    post = create( :post )
    sign_in_with user
  end
  scenario 'view post on image click' do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
    expect(page.current_path).to eq(post_path(1))
  end
end
