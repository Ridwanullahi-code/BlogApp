class AddReferencesToTables < ActiveRecord::Migration[7.0]
  def change
    # add foreign keys reference authors(author_id and post_id) to comments table
    add_reference :comments, :users, null:false, foreign_key:true
    add_reference :comments, :posts, null:false, foreign_key:true
    # add foreign keys reference authors table(author_id) to comments table
    add_reference :posts, :users, null:false, foreign_key:true
     # add foreign keys reference authors table(author_id) to likes table
    add_reference :likes, :users, null:false, foreign_key:true
    add_reference :likes, :posts, null:false, foreign_key:true
  end
end
