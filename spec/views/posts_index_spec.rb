require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'PostIndex', type: :feature do
  before(:each) do
    @user = User.create(name: 'Fatima', photo: 'https://picsum.photos/300/200', bio: 'CEO Nairobi Hub',
                        posts_counter: 2)
    @post1 = @user.posts.create(title: 'Post 1', text: 'Life of single man', comments_counter: 2, likes_counter: 3)
    @post2 = @user.posts.create(title: 'Post 2', text: 'Man need money', comments_counter: 2, likes_counter: 5)
    visit user_posts_path(@user)
  end

  it 'displays the author name' do
    expect(page).to have_content('Fatima')
  end

  it 'display total comments and likes for the post' do
    expect(page).to have_content(@post1.comments_counter)
    expect(page).to have_content(@post1.likes_counter)
  end

  it 'displays the first comment' do
    expect(page).to have_content(@post1.comments.first)
  end

  it 'displays the post titles' do
    expect(page).to have_content(@user.posts.first.title)
    expect(page).to have_content(@user.posts.second.title)
  end

  it 'displays the total number of posts' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end

  it 'displays the post author and creation date' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
  end

  it 'has a link to view each post' do
    expect(page).to have_link(href: user_post_path(@user.id, @post1.id))
    expect(page).to have_link(href: user_post_path(@user.id, @post2.id))
  end

  it 'displays a section for pagination if there are more posts than fit on the view' do
    @user.posts.create(title: 'Post 6', text: 'First Time Home Buyer Tips', comments_counter: 2, likes_counter: 3)
    @user.posts.create(title: 'Post 7', text: 'Job interview tips', comments_counter: 2, likes_counter: 5)
    @user.posts.create(title: 'Post 8', text: 'Nature Photography', comments_counter: 3, likes_counter: 1)
    visit user_posts_path(@user)
    expect(page).to have_selector('.digg_pagination')
  end
end
