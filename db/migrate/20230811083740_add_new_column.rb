class AddNewColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :like, :integer, default: 0 
  end
end
