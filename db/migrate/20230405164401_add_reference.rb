class AddReference < ActiveRecord::Migration[7.0]
  def change
    # add foreign keys reference authors(author_id and post_id) to comments table
    add_reference :comments, :author, null:false, foreign_key: {to_table: :users}
    add_reference :comments, :post, null:false, foreign_key:true
    # add foreign keys reference authors table(author_id) to comments table
    add_reference :posts, :author, null:false, foreign_key:{to_table: :users}
    # add foreign keys reference authors table(author_id) to likes table
    add_reference :likes, :author, null:false, foreign_key:{to_table: :users}
    add_reference :likes, :post, null:false, foreign_key:true
  end
end
