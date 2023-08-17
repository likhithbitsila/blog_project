class AddLikeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :u_like, :integer, default: 0 
  end
end
