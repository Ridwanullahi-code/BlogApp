require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Python', text: 'Backend porgramming language', comments_counter: 10, likes_counter: 10) }
  before { subject.save }

  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should allow_value(10).for(:comments_counter) }
  it { should validate_numericality_of(:comments_counter) }
  it { should allow_value(5).for(:likes_counter) }
  it { should validate_numericality_of(:likes_counter) }

  it 'title should must not be empty' do
    expect(subject.title).not_to be(nil)
  end
  it 'comments_counter must greater than zero' do
    expect(subject.comments_counter).to be > 0
  end

  describe 'methods' do
    it 'can not update comments counter when its a private method' do
      expect(subject).to respond_to(:update_posts_counter)
    end

    it 'should display most recent posts' do
      expect(subject.most_recent_comments).to eq(subject.comments.last(5))
    end
  end
  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:author).class_name('User') }
  end
end
