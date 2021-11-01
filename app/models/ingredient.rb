class Ingredient < ApplicationRecord
  belongs_to :recipe, touch: true

  validates :recipe_id, :name, :measurement, presence: true
end
