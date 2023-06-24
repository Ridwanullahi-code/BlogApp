require 'rails_helper'

require 'capybara/rspec'

RSpec.feature 'display the user index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Fatima', photo: 'https://www.img2link.com/images/2023/04/13/c2bbea766ec481f3d798809dd39eedb6.png', posts_counter: 0, email: 'example@gmail.com', password: 'fatima1256')

    # Visit the login page
    visit user_session_path

    # Fill in the login form with username and password
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    # Click the login button
    click_button 'Log in'
    expect(page).to have_current_path root_path

    click_link @user.name
    expect(page).to have_current_path user_path(@user)
  end

  it 'displays the user name and profile image' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
    expect(page.has_xpath?("//img[@src='#{@user.photo}']")).to be true
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'display first 3 posts of user' do
    @user.posts.limit(3).each_with_index do |post, index|
      expect(page).to have_content("#{post.title} # #{index + 1}")
      expect(page).to have_content(post.text)
    end
  end

  it 'display all the buttons in user page' do
    expect(page).to have_content('see all posts')
    expect(page).to have_link(href: user_posts_path(@user))
    expect(page).to have_link(href: user_path(@user))
  end
end
