class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  validates :img_url, presence: true # , format: { with: /\.(png|jpg|jpeg)\Z/i }
  validates :video_url, format: { with: %r{^(?:https?://)?(?:m\.|www\.)?(?:youtu\.be/|youtube\.com/(?:embed/|v/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$}, multiline: true }
  validates :user_id, :name, :slug, :img_url, :instructions, :video_url, presence: true
  validates :ref_id, presence: true
end
