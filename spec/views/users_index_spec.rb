require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'UsersIndices', type: :feature do
  let!(:user) { User.create(name: 'Fatima', photo: 'https://www.img2link.com/images/2023/04/13/c2bbea766ec481f3d798809dd39eedb6.png', posts_counter: 0) }

  before do
    visit users_path
  end

  it 'displays the user name and profile image, and total posts on the index page' do
    expect(page).to have_content(user.name)
    expect(page.has_xpath?("//img[@src='#{user.photo}']")).to be true
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'has a link to view each user' do
    expect(page).to have_link(href: user_path(user))
  end
end
