class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  after_save :most_recent_posts

  def most_recent_posts
    posts.where(author: self).order(created_at: :desc).limit(3)
  end

  def posts_counter
    posts.count
  end
end
