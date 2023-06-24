require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @author = User.new(name: 'Alex',
                       photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life of programmer')

    @post = Post.new(author: @author, title: 'Post for testing', text: 'This post is for test')
    @comment1 = Comment.create(author: @author, post: @post, text: 'Test comment1')
    @comment2 = Comment.create(author: @author, post: @post, text: 'Test comment2')
  end
  it 'should update comments_counter' do
    expect(@comment1).to respond_to(:comments_counter)
    expect(@comment2).to respond_to(:comments_counter)
  end
  it 'will have the post comments_counter through update_comments_counter' do
    expect(@post.comments_counter).to eq(2)
  end
end
