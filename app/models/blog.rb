class Blog < ApplicationRecord
    
    validates :author, :authors_email, :title, :desciption, :pages, :release_date, presence: true
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    



    
end
