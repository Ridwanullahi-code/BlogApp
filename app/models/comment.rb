class Comment < ApplicationRecord
	belongs_to :author, class_name: 'User'
	belongs_to :post 
	after_save :update_comments_count

	def update_comments_count
		post.increment!(:comments_counter)
	end
end
