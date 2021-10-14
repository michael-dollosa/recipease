class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :recipe_id, :name, :measurement, presence: true
end
