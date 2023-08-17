class ConnectLikeBlog < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, :blog_id
    add_foreign_key :likes, :blogs
  end
end
