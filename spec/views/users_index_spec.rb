require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'UsersIndices', type: :feature do
  before(:each) do
    @users = [
      User.create(name: 'Fatima', photo: 'https://picsum.photos/200/200', bio: 'CEO Nairobi Hub', posts_counter: 3, email: 'alex@gmail.com', password: 'fatima190'),
      User.create(name: 'Melissa', photo: 'https://picsum.photos/200/300', bio: 'Teacher from Mexico.',
                  posts_counter: 3, email: 'name@gmail.com', password: 'melisa234'),
      User.create(name: 'Nick', photo: 'https://picsum.photos/200/400', bio: 'A software developer', posts_counter: 0, email: 'jose@gmail.com', password: 'nick1782')
    ]
    # Visit the login page
    visit user_session_path

    # Fill in the login form with username and password
    fill_in 'Email', with: @users.first.email
    fill_in 'Password', with: @users.first.password

 
    click_button 'Log in'
    expect(page).to have_current_path root_path
  end

  it 'displays the user name and profile image, and total posts on the index page' do
    @users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css('img')
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
      expect(page).to have_link(href: user_path(user))
    end
  end
end
