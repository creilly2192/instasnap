require 'rails_helper.rb'

feature 'Can edit a post' do
  background do
    job = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit'
  end

  it 'should not update post without an image' do
    attach_file('Image', 'spec/files/images/html5-boilerplate_v5.3.0.zip')
    click_button 'Update Post'
    expect(page).to have_content("Post was NOT updated!")
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: 'Oh god, you weren’t meant to see this picture!'
    click_button 'Update Post'
    expect(page).to have_content('Post was successfully updated!')
    expect(page).to have_content('Oh god, you weren’t meant to see this picture!')
  end
end
