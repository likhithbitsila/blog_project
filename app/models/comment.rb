class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :blog
  belongs_to :user
end
