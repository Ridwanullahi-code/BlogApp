require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @author = User.new(name: 'Ridwan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life of programmer')
    @post = Post.new(author: @author, title: 'Python', text: 'Backend porgramming language')
    @comment = Comment.create(author: @author, post: @post, text: 'Test comment1')
  end

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should allow_value(10).for(:comments_counter) }
  it { should validate_numericality_of(:comments_counter) }
  it { should allow_value(5).for(:likes_counter) }
  it { should validate_numericality_of(:likes_counter) }

  it 'title should must not be empty' do
    expect(@post.title).not_to be(nil)
  end
  it 'comments_counter must greater than zero' do
    expect(@post.comments_counter).to be > 0
  end

  describe 'methods' do
    it 'can not update comments counter when its a private method' do
      expect(@post).to respond_to(:update_author_posts_counter)
    end
  end
  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:author).class_name('User') }
  end
end
