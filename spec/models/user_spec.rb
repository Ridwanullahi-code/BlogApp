require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name:	'Ridwan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer', posts_counter: 5) }
  before { subject.save }

  describe 'validate the user model' do
    it { should validate_presence_of(:name) }
    it 'name must be present' do
      expect(subject.name).to eq('Ridwan')
    end
    it 'test posts_counter to be instance of integer' do
      expect(subject.posts_counter).to be_a(Integer)
    end
    it 'test posts_counter not to less than zero' do
      expect(subject.posts_counter).not_to be(0)
    end
    it 'test post_counter value must be 5' do
      expect(subject.posts_counter).to be(5)
    end
    it 'Raises a TypeError if posts_counter is not an integer' do
      expect { subject.posts_counter }.not_to raise_error
    end
    it 'should display most recent posts' do
      expect(subject.most_recent_posts).to eq(subject.posts.last(3))
    end
  end
  describe 'associations' do
    it { should have_many(:posts) }
  end
end
