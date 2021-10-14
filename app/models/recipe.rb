class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  validates :user_id, :name, :slug, :img_url, :instructions, :video_url, presence: true
end
