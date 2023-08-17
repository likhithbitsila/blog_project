class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :author
      t.string :authors_email
      t.string :title
      t.text :desciption
      t.string :pages
      t.date :release_date

      t.timestamps
    end
  end
end
