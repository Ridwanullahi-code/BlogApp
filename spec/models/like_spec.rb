require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Model Test' do
    subject { Like.new(author_id: 5, post_id: 5) }
    before { subject.save }

    describe 'test like object' do
      it 'should update likes_counter' do
        expect(subject).to respond_to(:update_likes_counter)
      end
    end

    describe 'associations' do
      it { should belong_to(:author).class_name(:User) }
      it { should belong_to(:post) }
    end
  end
end
