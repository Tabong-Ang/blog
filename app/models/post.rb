class Post < ApplicationRecord
  belongs_to :user
  validates :title, :description, :image_url, presence: true
end
