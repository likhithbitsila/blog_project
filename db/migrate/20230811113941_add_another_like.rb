class AddAnotherLike < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :new_like, :integer, default: 0 
  end
end
