require 'rails_helper'

require 'capybara/rspec'

RSpec.feature 'display the user index page', type: :feature do
  before(:each) do
    @users = [
      User.create(name: 'Fatima', photo: 'https://picsum.photos/300/200', bio: 'CEO Nairobi Hub', posts_counter: 3),
      User.create(name: 'Melissa', photo: 'https://picsum.photos/300/200', bio: 'Teacher from Mexico.',
                  posts_counter: 3),
      User.create(name: 'Nick', photo: 'https://picsum.photos/300/200', bio: 'A software developer', posts_counter: 0)
    ]
    visit user_path(@users.first)
  end

  it 'displays the user name and profile image' do
    expect(page).to have_content(@users.first.name)
    expect(page).to have_content(@users.first.bio)
    expect(page.has_xpath?("//img[@src='#{@users.first.photo}']")).to be true
    expect(page).to have_content("Number of posts: #{@users.first.posts_counter}")
  end

  it 'display first 3 posts of user' do
    @users.first.posts.limit(3).each_with_index do |post, index|
      expect(page).to have_content("#{post.title} # #{index + 1}")
      expect(page).to have_content(post.text)
    end
  end

  it 'display all the buttons in user page' do
    expect(page).to have_content('see all posts')
    expect(page).to have_link(href: user_posts_path(@users.first))
    expect(page).to have_link(href: user_path(@users.first))
  end
end
