require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @author = User.new(name: 'Ridwan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life of programmer')
    @post1 = Post.create(author: @author, title: 'Post for testing 1', text: 'This post is for test 1')
    @post2 = Post.create(author: @author, title: 'Post for testing 2', text: 'This post is for test 2')
    @post3 = Post.create(author: @author, title: 'Post for testing 3', text: 'This post is for test 3')
    @post4 = Post.create(author: @author, title: 'Post for testing 4', text: 'This post is for test 4')
  end

  describe 'validate the user model' do
    it { should validate_presence_of(:name) }
    it 'name must be present' do
      expect(@author.name).to eq('Ridwan')
      expect(@post1.title).to eq('Post for testing 1')
    end
    it 'test posts_counter to be instance of integer' do
      expect(@author.posts_counter).to be_a(Integer)
    end
    it 'test posts_counter not to less than zero' do
      expect(@author.posts_counter).not_to eq(0)
    end
    it 'test post_counter value must be 5 line' do
      expect(@author.posts_counter).to eq(4)
    end
    it 'Raises a TypeError if posts_counter is not an integer' do
      expect { @author.posts_counter }.not_to raise_error
    end
  end
  describe 'associations' do
    it { should have_many(:posts) }
  end
end
