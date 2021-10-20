class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  validates :img_url, format: { with: /\.(png|jpg|jpeg)\Z/i }
  validates :user_id, :name, :slug, :img_url, :instructions, :video_url, presence: true
end
