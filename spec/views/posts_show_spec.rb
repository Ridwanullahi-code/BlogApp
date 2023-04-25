require 'rails_helper'

RSpec.feature 'PostIndex', type: :feature do
  let!(:user) do
    User.create(
      name: 'Micheal',
      photo: 'https://picsum.photos/300/200',
      bio: 'CEO Nairobi Hub', posts_counter: 1
    )
  end

  let!(:post) do
    user.posts.create(author: user, title: 'Post 1', text: 'Life of single man', comments_counter: 2, likes_counter: 0)
  end
  let!(:comment1) { Comment.create(author: user, post:, text: 'Good post') }
  let!(:comment2) { Comment.create(author: user, post:, text: 'Very Intresting') }

  before do
    visit user_posts_path(user, post)
  end

  it 'displays post author name' do
    expect(page).to have_content(post.author.name)
  end

  it 'displays the comments text for post' do
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end

  it 'displays the post title and body' do
    expect(page).to have_content(user.posts.first.title)
    expect(page).to have_content(user.posts.first.text)
  end

  it 'display total comments and likes for the post' do
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'count total number of comments' do
    expect(post.comments_counter).to eq(2)
  end

  it 'displays comment author name' do
    expect(page).to have_content(comment1.author.name)
    expect(page).to have_content(comment2.author.name)
  end

  it 'displays comment author name' do
    expect(page).to have_content(user.posts.first.comments.first.text)
    expect(page).to have_content(user.posts.first.comments.second.text)
  end
end
