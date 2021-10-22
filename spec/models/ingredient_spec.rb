require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  subject(:ingredient) do
    described_class.new(
      recipe_id: recipe.id,
      name: 'test ingredient',
      measurement: '1/2 tbs'
    )
  end

  let(:recipe) { create(:recipe) }

  it 'is valid with valid attributes' do
    expect(ingredient).to be_valid
  end

  it 'is not valid without recipe id' do
    ingredient.recipe_id = nil
    expect(ingredient).not_to be_valid
  end

  it 'is not valid without name id' do
    ingredient.name = nil
    expect(ingredient).not_to be_valid
  end

  it 'is not valid without measurement' do
    ingredient.measurement = nil
    expect(ingredient).not_to be_valid
  end
end
